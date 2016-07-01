class Deck
	def initialize
		@deck = ["B", 6, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 42, 43, 44, 45, 46, 47, 48, 49, 50, 52, 1, 2, 9, 10, 11, 3, "A", 4, 5, 7, 8, 12, 13, 51]
	end


	def move_A(int)
		@deck.delete("A")
		@deck.insert(int, "A")
		puts ""
		puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>move_A: #{@deck}"
	end

	def move_B(int)
		@deck.delete("B")
		@deck.insert(int, "B")
		puts ""
		puts "move_B: #{@deck}"
	end
=begin
	def triple_cut
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts "#{@deck}"
			abv_b = (0..(@deck.index("B"))-1)  #range from beginning of arr to b4 "B"
			puts "Above_B: #{abv_b}"
			bel_a = (@deck.index("A") - abv_b.size+1)..@deck.index(@deck.last) #range from *<x> to end of arr
			puts "Below_A: #{bel_a}"
			take_b = @deck.slice(abv_b) #captures the numbers above "B"
			puts "Take_b_arr: #{take_b}"
			@deck.slice!(abv_b) #slices the numbers below "B" from the array
			puts "triple_cut_op1: #{@deck}"
			take_a = @deck.slice(bel_a) #captures the number below "A"
			puts "Take_A_arr: #{take_a}"
			@deck.slice!(bel_a) #slices the numbers below "B"
			puts "triple_cut_op2: #{@deck}"
			@deck = @deck.concat(take_b) #puts numbers abv_b at the end of arr
			puts "triple_cut_op3: #{@deck}"
			take_a.each {|i| @deck << i}
			puts "triple_cut_opFinal: #{@deck}"
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			return @deck
	end
=end

	def triple_cut
		 a = @deck.index( 'A' )
		 b = @deck.index( 'B' )
		 a, b = b, a if a > b
		 @deck.replace( [ @deck[(b + 1)..-1],
											@deck[a..b],
											@deck[0...a] ].flatten )
		 puts ""
		 puts "Triple_cut: #{@deck}"
	end

	def move_downA
		move_A(@deck.index("A") + 1)
		puts ""
		puts "move_downA: #{@deck}"
	end

	def move_downB
		if @deck.last == "B"
			move_B(2)
		elsif @deck[@deck.index(@deck.last) - 1] == "B"
			move_B(1)
		elsif @deck.include?(53)
			@deck.delete(53)
			move_B(52)
		else
			dwn = @deck.index("B") + 2
			move_B(dwn)
		end
		puts ""
		puts "move_downB: #{@deck}"
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
		puts ""
		print " Cut_count out_put: #{@deck} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

=begin
		move_downA
		print " 2nd iteration with move_downB #{@deck}"
		move_downB
		print " 2nd iteration with move_downB #{@deck}"
=end
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

	def generate_keystream( length )
			result = []

      while result.size != length
        move_downA
        move_downB
      	triple_cut
        cut_count
      	result << out_letter unless out_letter.nil?
    	end
			result.compact!
      puts " #{result.join}"
			#puts @deck.last
			#puts @deck.index(@deck.last)
    end
end


yugi = Deck.new
print yugi.generate_keystream(1)
