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
			bottom_val = @deck.last
			a = "A"
			b = "B"

			@deck[-1] == 53 if @deck[-1].is_a? String


			arr = @deck[0..(@deck[-1]-1)]
			@deck.slice!(0..@deck.last-1)
			@deck.insert(@deck.index(@deck.last), arr)
			@deck.flatten!
			move_downA
			move_downB
			@deck[52]
			#deck_p
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
	end

	def deck_p                       ## For test purposes only.
		return @deck
	end

	def gen_keystream(string)
		res = []
		while res.size < string.size
			cut_count
			let  = out_letter
			res << let unless let.nil?
		end
		return res

	end

end

yugi = Deck.new
print yugi.cut_count
#the problem is that we cannot convert "B" into 53
