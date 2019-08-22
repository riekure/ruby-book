require 'minitest/autorun'
require './codeWars/grow'

class GrowTest < Minitest::Test
  def test_grow
    assert_equal grow([1, 2, 3, 4]), 24
  end
end
