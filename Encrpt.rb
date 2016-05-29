
class Encrypter
	def initialize(keystream)
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
  		inn = ""
  		arr.collect! {|i| inn << i.to_s}
  		out = ""
  		(inn.size / 5).times {|i| out << inn[i*5, 5] << " "}
  		return out
	end

	def de_conv(x)
		bet = conv(x)

	end


end
