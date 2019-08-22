require 'minitest/autorun'
require './codeWars/grasshopper'

class GrasshopperTest < Minitest::Test
  def test_grasshopper
    assert_equal 36, summation_a(8)
    assert_equal 36, summation_b(8)
    assert_equal 36, summation_c(8)
    assert_equal 36, summation_d(8)
  end
end
