class Deck

	def initialize 
		@deck = (1..52).to_a << "A" << "B"
	end

	def move_A(int)
		@deck.delete("A")
		@deck.insert(int, "B")
	end

	def move_B(int)
		@deck.delete("B")
		@deck.insert(int, "B")
	end

	def triple_cut
		a = @deck.index("A")
		b = @deck.index("B")
		abv_b = 0..b-1
		bel_a = a-x+1..@deck.index(array.last)
		take_b = @deck.slice(abv_b)	
		array.slice!(abv_b)
		take_a = array.slice(bel_a)
		array.slice!(bel_a)
		@deck = take_b.concat(@deck)
		take_a.each {|i| @deck << i}
		return @deck
	end

	def move_down(char, int)
		dwn = @deck.index(char) - int
		move_A(dwn)
	end

	

end
