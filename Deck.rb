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
  	2.times do
			triple_cut
			bottom_val = @deck.last
			a = "A"
			b = "B"

			if @deck.last == a or b
				@deck.last == 53
			end


			arr = @deck.slice(0..@deck.last-1)
			@deck.slice!(0..@deck.last-1)
			@deck.insert(@deck.index(@deck.last), arr)
			@deck.flatten!
		end



	end

	def out_letter #string characters are not skipped
		#@deck.reject {@deck[0].is_a? String}
		frst = @deck.first

		frst = 53 if @deck[0].is_a? String
		out = @deck[frst]
		if out.is_a? String
			nil
		else
			out -= 26 if out > 26
			(out + 64).chr
		end


		#val = @deck[@deck[0] - 2]

	  #let_to_num = { 1 => 'A', 2 =>  'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 8 => 'H', 9 => 'I', 10 => 'I', 11 => 'K', 12 => 'L', 13 => 'M', 14 => 'N', 15 => 'O', 16 => 'P', 17 => 'Q', 18 => 'R', 19 => 'S', 20 => 'T', 21 => 'U', 22 => 'V', 23 => 'W', 24 => 'X', 25 => 'Y', 26 => 'Z'}

		#out = []
		#out << let_to_num[@deck[val]]
	end

	def deck_p                       ## For test purposes only.
		return @deck
	end

	def gen_keystream(string)
		(string.length).times do
			move_downA
			move_downB
			triple_cut
			cut_count
			out_letter
		end
	end

end

yugi = Deck.new
print yugi.gen_keystream("hi")
