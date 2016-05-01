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
=begin
			if @deck[0].is_a? String
				@deck = @deck.reject{|x| x.is_a? String}
			end
=end
			@deck.each do |x|
				if @deck[-1].is_a? String
					@deck[-1] = 53
				end
				arr = @deck[0..(@deck[-1]-1)]
				@deck.slice!(0..@deck.last-1)
			  @deck.insert(@deck.index(@deck.last), arr)
			  @deck.flatten!
			end
			triple_cut
			#@deck[52]
			deck_p
	end

	def out_letter #string characters are not skipped
		cut_count
		frst = @deck.first
		out = @deck[frst]
		out -= 26 if out > 26
		res = (out + 64).chr
		return res
	end

	def deck_p                       ## For test purposes only.
		return @deck
	end

	def gen_keystream(string)
		res = []
		while res.size < string.size
			cut_count
			let  = out_letter
			res << let
		end
		return res

	end

end

yugi = Deck.new
print yugi.gen_keystream("ab")
#the problem is that we cannot convert "B" into 53
