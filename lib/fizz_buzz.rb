def fizz_buzz(n)
  if (n % 15).zero?
    'Fizz Buzz'
  elsif (n % 3).zero?
    'Fizz'
  else
    n.to_s
  end
end
