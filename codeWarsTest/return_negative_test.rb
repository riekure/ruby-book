require 'minitest/autorun'
require './codeWars/return_negative'

class returnNegativeTest < Minitest::Test
  def test_return_negative
    assert_equal -42, return_negative(42)
    assert_equal -42, return_negative(-42)
  end
end