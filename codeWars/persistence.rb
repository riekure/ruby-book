def int_to_array(int)
  array = []
  array = [0] if int == 0
  while int > 0
    digit = int % 10
    array.unshift(digit)
    int /= 10
  end
  array
end

def persistence(n)
  n < 10 ? 0 : persistence(int_to_array(n).inject(&:*)) + 1
end
