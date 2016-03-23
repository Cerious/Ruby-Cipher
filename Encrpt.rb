
class Encrypter
	def initialize(keystream)
		@keystream = keystream
	end
	
	def clean(x)
		nu_str = x.gsub(/\p{Punct}/, "")
  		nu_str.gsub!(/\p{blank}/, "")
  		new_str = ""
  		(nu_str.size / 5).times { |i| new_str << nu_str[i*5, 5] << " " }
  		if str.size % 5 == 4
  			1.times { str << "X" }
		elsif str.size % 5 == 3
  			2.times { str << "X" }
		elsif str.size % 5 == 2
  			3.times { str << "X" }
		elsif str.size % 5 == 1
  			4.times { str << "X" }
		end
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


end

	

