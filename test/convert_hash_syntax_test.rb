require 'minitest/autorun'
require './lib/convert_hash_syntax'

class ConvertHashSyntax < Minitest::Test
  def test_convert_hash_syntax
    old_sytax = <<~TEXT
      {
        :name => 'Alice',
        :age=> 20,
        :gender  =>  :female
      }
    TEXT
    expected = <<~TEXT
      {
        name: 'Alice',
        age: 20,
        gender: :female
      }
    TEXT
    assert_equal expected, convert_hash_syntax(old_sytax)
  end
end
