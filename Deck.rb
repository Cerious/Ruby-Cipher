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

	def triple_cut
		arr[0, arr.index("B")]
	end

end
