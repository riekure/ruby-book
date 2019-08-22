require 'minitest/autorun'
require './codeWars/persistence'

class PersistenceTest < Minitest::Test
  def test_persistence
    assert_equal persistence(39), 3
  end
end