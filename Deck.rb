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
		move_down
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

	def move_down
		if @deck.last == "A"
			move_A(1)
		else
			dwn = @deck.index(char) + 1
			move_A(dwn)
		end

		if @deck.last == "B"
			moveB(2)
		else
			dwn = @deck.index(char) + 2
			move_B(dwn)
		end
	end

	def cut_count
		val = @deck.last
		if @deck.last == "A" or "B"
			val = 53
		end

		arr = @deck.slice(@deck.index(0..val))
		@deck.slice!(@deck.index(0..val))
		@deck = arr.concat(@deck)
		return @deck 
	end

	def out_letter
		@deck[@deck[0] - 1]

		let_to_num = {
			1 => "A"
			2 => "B"
			3 =>"C"
			4 =>"D"
			5 =>"E"
			6 =>"F"
			7 =>"G"
			8 =>"H"
			9 =>"I"
			10 =>"J"
			11 =>"K"
			12 =>"L"
			13 =>"M"
			14 =>"N"
			15 =>"O"
			16 =>"P"
			17 =>"Q"
			18 =>"R"
			19 =>"S"
			20 =>"T"
			21 =>"U"
			22 =>"V"
			23 =>"W"
			24 =>"X"
			25 =>"Y"
			26 =>"Z"
		}

	end





end


