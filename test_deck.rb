require_relative 'Deck'
require 'minitest/autorun'

class TestDeck < MiniTest::Test

  $d1 = Deck.new
  $arr = (1..52).to_a << "A" << "B"

  def test_cut_count
    arr = (2..52).to_a << "A" << "B" << 1
    assert_equal arr, $d1.cut_count
  end

  def test_moveA_with_int_one
    $arr.insert(1, "A")
    assert_equal $arr, $d1.move_A(1)
  end

  def test_moveA_with_int_more_than_one
    $arr.insert(6, "A")
    assert_equal $arr, $d1.move_A(6)
  end

  def test_move_downB
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_move_downB_when_B_is_last
    $arr.delete("B")
    $arr.insert(2, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_move_downB_when_B_is_next_last
    $arr.delete("B")
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_moveB_with_int_one
    $arr.delete("B")
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_B(1)
  end

  def test_moveB_with_int_more_than_one
    $arr.delete("B")
    $arr.insert(5, "B")
    assert_equal $arr, $d1.move_B(5)
  end

  def test_move_down_A
  end

  def test_move_down_B
  end

  def test_triple_cut
    $arr.delete("B")
    $arr.insert(0, "B")
    $arr.delete(1)
    $arr.insert($arr.index($arr.last), 1)
  end

  def test_cut_count
    $arr.delete(1)
    $arr.insert($arr.index($arr.last), 1)
    assert_equal $arr, $d1.cut_count
  end

  def test_out_letter
    assert_equal ["D"], $d1.out_letter
  end

  #def test_gen_keystream_works_with_more_than_one_value
  #end
end
