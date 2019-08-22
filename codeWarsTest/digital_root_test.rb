require 'minitest/autorun'
require './codeWars/defital_root'

class DigitalRootTest < Minitest::Test
  def test_digital_root
    assert_equal 6, digital_root(132189)
  end
end