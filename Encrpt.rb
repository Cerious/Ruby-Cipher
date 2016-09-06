require_relative 'Deck'

class Encrypter
	def initialize()
		@keystream = keystream
	end

	def clean(x)
	    str = x.gsub(/\p{Punct}/, "")
			str.gsub!(/\p{blank}/, "")
	    str.upcase!
	    until str.size % 5 == 0
	      str << "X"
	    end
	    new_str = ""
	    (str.size / 5).times { |i| new_str << str[i*5, 5] << " " }
	    new_str
	end

	def conv(x)
	  x.gsub!(/\p{Blank}/, "")
	  arr = []
	  x.each_byte {|i| arr << i-64}
	  arr
	end

	def add_nums(x) ## adds elements from separate arrays
		x.times do |i|
			val = arr[i] + arr2[i]
			if val > 26
				val = val - 26
			end
			arr3 << val
		end
	end

	def message_conv(x) #genrates a letter for every number in the keystream
	  clean_message = clean(x).gsub(/\p{blank}/, "")
	  yugi = Deck.new
	  ohh = yugi.generate_keystream(clean_message.length)
	  clean(ohh)
	end

	def de_conv(array)
	  array2 = []
	  array.each do |i|
	    array2 << (i+64).chr
	  end
	  array2.join(" ")
	end



end
raw = Deck.new()
encry = Encrypter.new
puts encry.clean("hi, my name is nick.")
