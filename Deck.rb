class Deck
attr_writer :deck
	def initialize
		@deck = (1..52).to_a << "A" << "B"
	end

	def move_A(int)
		@deck.delete("A")
		@deck.insert(int, "A")
	end

	def move_B(int)
		@deck.delete("B")
		@deck.insert(int, "B")
	end

	def triple_cut
			abv_b = (0..(@deck.index("B"))-1)
			bel_a = (@deck.index("A") - abv_b.size+1)..@deck.index(@deck.last)
			take_b = @deck.slice(abv_b)
			@deck.slice!(abv_b)
			take_a = @deck.slice(bel_a)
			@deck.slice!(bel_a)
			@deck = @deck.concat(take_b)
			take_a.each {|i| @deck << i}
			return @deck
	end

	def move_downA
		move_A(@deck.index("A") + 1)
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
		end

=begin
		move_downA
		print " 2nd iteration with move_downB #{@deck}"
		move_downB
		print " 2nd iteration with move_downB #{@deck}"
=end
	end

	def out_letter #string characters are not skipped
		if @deck[0].is_a? String
			puts " hello"
			@deck[0] = 53
		end
			print " Cut_count out_put: #{@deck}"
		frst = @deck.first
		out = @deck[frst]
		out -= 26 if out > 26
		res = (out + 64).chr
		return res
	end

	def generate_keystream( length )
		deck = @deck.dup
			result = []

      while result.length != length
        move_downA
        move_downB
      	triple_cut
        cut_count
        result << out_letter unless out_letter.nil?
				result
    	end
      puts " #{result.join}"
			#puts @deck.last
			#puts @deck.index(@deck.last)
    end
end

yugi = Deck.new
print yugi.generate_keystream(3)
