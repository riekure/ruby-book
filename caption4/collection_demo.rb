# 4.4.1 map/collect
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10}
p new_numbers

new_numbers = numbers.map { |n| n * 10}
p new_numbers

# 4.4.2 select/find_all/reject
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select { |n| n.even? }
even_numbers = numbers.select(&:even?)
p even_numbers

# 3の倍数を除外する
non_multiples_of_three = numbers.reject { |n| (n % 3).zero?}
p non_multiples_of_three

# 4.4.3 find/detect
even_numbers = numbers.find { |n| n.even? }
even_numbers = numbers.find(&:even?)
p even_numbers

# 4.4.4 inject/reduce
sum = numbers.inject(0) { |result, n| result + n }
p sum
