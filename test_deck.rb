require_relative 'Deck'
require 'minitest/autorun'

class TestDeck < MiniTest::Test

  $d1 = Deck.new
  $arr = (1..52).to_a << "A" << "B"

  def test_cut_count
    skip
    arr = (2..52).to_a << "A" << "B" << 1
    assert_equal arr, $d1.cut_count
  end

  def test_moveA_with_int_one
    skip
    $arr.insert(1, "A")
    assert_equal $arr, $d1.move_A(1)
  end

  def test_moveA_with_int_more_than_one
    skip
    $arr.insert(6, "A")
    assert_equal $arr, $d1.move_A(6)
  end

  def test_move_downB
    skip
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_move_downB_when_B_is_last
    skip
    $arr.delete("B")
    $arr.insert(2, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_move_downB_when_B_is_next_last
    skip
    $arr.delete("B")
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_downB
  end

  def test_moveB_with_int_one
    skip
    $arr.delete("B")
    $arr.insert(1, "B")
    assert_equal $arr, $d1.move_B(1)
  end

  def test_moveB_with_int_more_than_one
    skip
    $arr.delete("B")
    $arr.insert(5, "B")
    assert_equal $arr, $d1.move_B(5)
  end

  def test_move_down_A
    $arr.delete("A")
    $arr.insert($arr.index($arr.last), "A")
    assert_equal $arr, $d1.move_downA
  end

  def test_move_down_B
  skip 
  end

  def test_triple_cut
    skip
    $arr.delete("B")
    $arr.insert(0, "B")
    $arr.delete(1)
    $arr.insert($arr.index($arr.last), 1)
  end

  def test_cut_count
    skip
    $arr.delete(1)
    $arr.insert($arr.index($arr.last), 1)
    assert_equal $arr, $d1.cut_count
  end

  def test_out_letter
    skip
    assert_equal ["D"], $d1.out_letter
  end

  def test_gen_keystream_works_with_one_value
    assert_equal ["D"], $d1.gen_keystream("a")
  end

  def test_gen_keystream_works_with_two_values
    assert_equal ["D","W"], $d1.gen_keystream("ab")
  end

  def test_B_equals_53_when_last
    assert_equal $d1.include?(4)
  end
end
