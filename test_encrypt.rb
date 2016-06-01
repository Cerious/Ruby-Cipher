require_relative 'Encrpt'
require 'minitest/autorun'

class TestEncrpt << MiniTest::Test
  $crypt = Encrypt.new
  def test_clean_eliminates_punctuation
    assert_equal $crypt.clean("hi.,?!"), "hiXXX"
  end

  def test_clean_eliminates_spaces
    assert_equal $crypt.clean("hi im nick"), "hiimn ickX"
  end

  def test_string_size_in_clean_always_divisible_by_five
    assert_equal $crypt.clean("hi"), "HIXXX"
  end

  def test_strings_not_divisible_by_five_are_X_padded
    assert_equal $crypt.clean("hey"), "HEYXX"
    assert_equal $crpt.clean("string"), "STRING XXXXX"
  end

  def test_strings_in_clean_return_upcase
    assert_equal $crypt.clean("sup"), "SUPXX"
  end

  def test_clean_returns_string_five_char_groups
    assert_equal $crypt.clean("hi my name is nick."), "HIMYN AMEIS NICKX"
  end

  def test_conv_turns_letters_into_proper_numbers
    assert_equal $crypt.clean("A"), [1]
    assert_equal $crypt.clean("G"), [7]
  end

  def test_conv_works_with_strings_of_length_one
    assert_equal $crypt.conv("S"), [18]
  end

end
