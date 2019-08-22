require 'minitest/autorun'
require './codeWars/disemvowel_trolls'

class DisemvowelTrollsTest < Minitest::Test
  def test_disemvowel_trolls
    assert_equal "Ths wbst s fr lsrs LL!", disemvowel("This website is for losers LOL!")
  end
end