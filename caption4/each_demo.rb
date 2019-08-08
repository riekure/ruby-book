numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
puts sum

numbers.each do
  sum += 1
end
puts sum

numbers.each do |n|
  # 偶数ならば10倍、奇数ならそのまま
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
puts sum

# 改行を含む長いブロックを書く場合はdo...end
# 1行でコンパクトに書きたい場合は{}
numbers.each { |n| sum += n }
puts sum