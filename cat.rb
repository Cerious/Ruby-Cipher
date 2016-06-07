class Cat
  def meow
    puts "meow, meow!!!"
  end

  def me
    puts "This is the real me #{self}."
  end
end
chester =  Cat.new
chester.meow
chester.me
