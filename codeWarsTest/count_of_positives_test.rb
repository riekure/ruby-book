require 'minitest/autorun'
require './codeWars/count_of_positives'

class CountOfPositivesTest < Minitest::Test
  def test_count_of_positives
    assert_equal [4, -18], count_positives_sum_negatives([1, 2, 3, 4, -5, -6, -7])
  end
end
