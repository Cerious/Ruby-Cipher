class Deck
	def initialize 
		@deck = (1..52).to_a << "A" << "B"
	end

	def move_A(int, array)
		array.delete("A")
		array.insert(int, "B")
	end

	def move_B(int, array)
		array.delete("B")
		array.insert(int, "B")
	end

	def triple_cut(array)
		a = array.index("A")
		b = array.index("B")
		abv_a = 0..a-1
		bel_b = elevi-x+1..array.index(aarray.last)


	end

end
