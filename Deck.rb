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
		move_downA
		move_downB
		a = @deck.index("A")
		b = @deck.index("B")
		abv_b = (0..b-1)
		x = abv_b.size	
		bel_a = (a-x+1)..@deck.index(@deck.last)
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
		else
			dwn = @deck.index("B") + 2
			move_B(dwn)
		end

	end

	def cut_count
		triple_cut
		val = @deck.last
		a = "A"
		b = "B"
		if @deck.last == a or b
			val = 53
		end

		arr = @deck.slice(@deck.index(0..val))
		@deck.slice!(@deck.index(0..val))
		@deck = arr.concat(@deck)
		return @deck 
	end

	def out_letter
		val = @deck[@deck[0] - 1]

		let_to_num = { 1 => 'A', 2 =>  'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 8 => 'H', 9 => 'I', 10 => 'I', 11 => 'K', 12 => 'L', 13 => 'M', 14 => 'N', 15 => 'O', 16 => 'P', 17 => 'Q', 18 => 'R', 19 => 'S', 20 => 'T', 21 => 'U', 22 => 'V', 23 => 'W', 24 => 'X', 25 => 'Y', 26 => 'Z'}

		out = []
		out << let_to_num[@deck[val]]

	end
	
	def deck_p                       ## For test purposes only.
		return @deck
	end
end

yugi = Deck.new
print yugi.cut_count




