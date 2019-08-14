def convert_hash_syntax(old_syntax)
  puts old_syntax.gsub(/:(\w+) *=> */, '\1: ')
end

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
p expected
p convert_hash_syntax(old_sytax)