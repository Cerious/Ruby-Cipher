require_relative 'Deck'

def generate_keystream( length )
  return @deck
=begin
  deck = @deck.dup
    result = []

    while result.length != length
      deck.move_downA
      deck.move_downB
      deck.triple_cut
      deck.cut_count
      letter = deck.out_letter
      result << letter unless letter.nil?
    end
    result.join
=end
 end

puts generate_keystream(10)
