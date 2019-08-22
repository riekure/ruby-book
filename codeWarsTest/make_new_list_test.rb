require 'minitest/autorun'
require './codeWars/make_new_list'

class MakeNewListTest < Minitest::Test
  def test_make_new_list
    assert_equal [11, 110, 101], make_new_list([1, 10, 100, 1])
  end
end
