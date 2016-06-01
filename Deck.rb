class Deck

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
			move_B(53)
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
			@deck
	end

	def out_letter #string characters are not skipped
		deck = @deck.dup
		frst = @deck.first
		out = @deck[frst]
		out -= 26 if out > 26
		res = (out + 64).chr
		return res
	end

	def gen_keystream(string) #Value for out letter will not update.
		res = []
			while res.size < string.size
				move_downA
				move_downB
				triple_cut
				cut_count
				@deck = cut_count
				res << out_letter
			end
		return res
	end

end

yugi = Deck.new
puts yugi.out_letter
