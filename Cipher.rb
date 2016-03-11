new_str_2 = "thisismystringwithoutspacewoah"
new_str_2.upcase!
arr = []
new_str_2.each_char {|c| arr << c}

if new_str_2.size % 5 == 4
  1.times { arr << "X" }
elsif new_str_2.size % 5 == 3
  2.times { arr << "X" }
elsif new_str_2.size % 5 == 2
  3.times { arr << "X" }
elsif new_str_2.size % 5 == 1
  4.times { arr << "X" }
end

new_str = ""
arr.each {|i| new_str << i}
str = ""
(new_str.size / 5).times { |i| str << new_str[i*5, 5] << " " }
def crypt(x)
  x.gsub(/A/, "X")
  x.gsub(/B/, "G")
  x.gsub(/C/,"J")
  x.gsub(/D/, "K")
  x.gsub(/E/, "L")
  x.gsub(/F/, "P")
  x.gsub(/G/, "I")
  x.gsub(/H/, "R")
  x.gsub(/I/, "A")
  x.gsub(/J/, "Y")
  x.gsub(/K/, "Q")
  x.gsub(/L/, "H")
  x.gsub(/M/, "Z")
  x.gsub(/N/, "M")
  x.gsub(/O/,"U")
  x.gsub(/P/, "C")
  x.gsub(/Q/, "W")
  x.gsub(/R/, "D")
  x.gsub(/S/, "F")
  x.gsub(/T/, "N")
  x.gsub(/U/, "V")
  x.gsub(/V/,"S")
  x.gsub(/W/,"B")
  x.gsub(/X/,"E")
  x.gsub(/Y/, "T")
  x.gsub(/Z/, "O")
end




def decrypt(x)
  x.gsub(/X/, "A")
  x.gsub(/G/, "B")
  x.gsub(/J/,"C")
  x.gsub(/K/, "D")
  x.gsub(/L/, "E")
  x.gsub(/P/, "F")
  x.gsub(/I/, "G")
  x.gsub(/R/, "H")
  x.gsub(/A/, "I")
  x.gsub(/Y/, "J")
  x.gsub(/Q/, "K")
  x.gsub(/H/, "L")
  x.gsub(/Z/, "M")
  x.gsub(/M/, "N")
  x.gsub(/U/,"O")
  x.gsub(/C/, "P")
  x.gsub(/W/, "Q")
  x.gsub(/D/, "R")
  x.gsub(/F/, "S")
  x.gsub(/N/, "T")
  x.gsub(/V/, "U")
  x.gsub(/S/,"V")
  x.gsub(/B/,"W")
  x.gsub(/E/,"X")
  x.gsub(/T/, "Y")
  x.gsub(/O/, "Z")
end

puts crypt(str)
puts decrypt(crypt(str))
