### A card Cipher that returns a string of letters based on how many times the deck is shuffled   
### 
###
###
class Deck
	def initialize
		@deck = (1..52).to_a << "A" << "B"
	end


	def move_A(int)
		if @deck.include?("A") && @deck.include?(53)
			pos = @deck.index(53)
			@deck.delete(53)
			@deck.insert(pos, "B")
		end


		@deck.delete("A")
		@deck.insert(int, "A")
	#	puts ""
	#	puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>move_A: #{@deck}"
	end

	def move_B(int)
		@deck.delete("B")
		@deck.insert(int, "B")
	#	puts ""
	#	puts "move_B: #{@deck}"
	end


	def triple_cut
		 a = @deck.index( 'A' )
		 b = @deck.index( 'B' )
		 a, b = b, a if a > b
		 @deck.replace( [ @deck[(b + 1)..-1],
											@deck[a..b],
											@deck[0...a] ].flatten )

	#										puts ""
	#										puts "Triple_cut: #{@deck}"
	end

	def move_downA
		if @deck.include?("B") && @deck.include?(53)
			pos = @deck.index(53)
			@deck.delete(53)
			@deck.insert(pos, "A")
		end
		move_A(@deck.index("A") + 1)
	#	puts ""
	#	puts "move_downA: #{@deck}"
	end

	def move_downB
		if @deck.last == "B"
			move_B(2)
		elsif @deck[@deck.index(@deck.last) - 1] == "B"
			move_B(1)
		#elsif @deck.include?(53)
		#	@deck.delete(53)
		#	move_B(52)
		#	move_B(1)
		else
			dwn = @deck.index("B") + 2
			move_B(dwn)
		end
	#	puts ""
	#	puts "move_downB: #{@deck}"
	end


	def cut_count
		@deck.each do |x|
			if @deck[-1].is_a? String
				@deck[-1] = 53
			end
			arr = @deck[0..(@deck[-1]-1)]
			@deck.slice!(0..@deck.last-1)
			@deck.insert(@deck.index(@deck.last), arr)
			@deck.flatten!
			@deck
		end
		# puts ""
		# print " Cut_count out_put: #{@deck} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

	end

	def out_letter #string characters are not skipped
		if @deck[0].is_a? String
			@deck[0] = 53
		end
		out = @deck[@deck.first]
		if out.is_a? String
			out = nil
			res = out
		else
			out -= 26 if out > 26
			res = (out + 64).chr
		end
		return res
	end

	def generate_keystream( shuffles )
			result = []

      while result.size != length
        move_downA
        move_downB
      	triple_cut
        cut_count
      	result << out_letter unless out_letter.nil?
    	end
			result.compact!
      #puts " #{result.join}"
			result.join
    end
end
