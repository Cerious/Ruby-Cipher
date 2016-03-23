str = "Code in ruby live longer."

def clean(x)
  x.upcase!
  if x.size % 5 == 4
    1.times { x << "X" }
  elsif x.size % 5 == 3
    2.times { x << "X" }
  elsif x.size % 5 == 2
    3.times { x << "X" }
  elsif x.size % 5 == 1
    4.times { x << "X" }
  end
  nu_str = x.gsub(/\p{Punct}/, "")
  nu_str.gsub!(/\p{blank}/, "")
  new_str = ""
  (nu_str.size / 5).times { |i| new_str << nu_str[i*5, 5] << " " }
  return new_str
  
end

def conv_1(y)
  y.gsub!(/A/, "1 ")
  y.gsub!(/B/, "2 ")
  y.gsub!(/C/, "3 ")
  y.gsub!(/D/, "4 ")
  y.gsub!(/E/, "5 ")
  y.gsub!(/F/, "6 ")
  y.gsub!(/G/, "7 ")
  y.gsub!(/H/, "8 ")
  y.gsub!(/I/, "9 ")
  y.gsub!(/J/, "10 ")
  y.gsub!(/K/, "11 ")
  y.gsub!(/L/, "12 ")
  y.gsub!(/M/, "13 ")
  y.gsub!(/N/, "14 ")
  y.gsub!(/O/, "15 ")
  y.gsub!(/P/, "16 ")
  y.gsub!(/Q/, "17 ")
  y.gsub!(/R/, "18 ")
  y.gsub!(/S/, "19 ")
  y.gsub!(/T/, "20 ")
  y.gsub!(/U/, "21 ")
  y.gsub!(/V/, "22 ")
  y.gsub!(/W/, "23 ")
  y.gsub!(/X/, "24 ")
  y.gsub!(/Y/, "25 ")
  y.gsub!(/Z/, "26 ")

  return y[0].to_i + 2
end


puts conv_1(clean str) 
