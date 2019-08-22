require 'minitest/autorun'
require './codeWars/square'

class SquareTest < Minitest::Test
  def test_square
    assert_equal false, is_square(-1)
  end
end