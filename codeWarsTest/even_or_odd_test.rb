require 'minitest/autorun'
require './codeWars/even_or_odd'

class EvenOrOddTest < Minitest::Test
  def test_even_or_odd
    assert_equal 'Even', even_or_odd(2)
    assert_equal 'Odd', even_or_odd(3)
  end
end