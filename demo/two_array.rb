line = Array.new(2) { Array.new(3, '0') }
p line

# 要素の変更
line[0][0] = '1'
p line

# 要素の追加①
line[2] = ['1', '2']
p line

# 要素の追加②
line[1].push('1', '2')
p line

# 要素の削除①
p line[1].delete_at(4)
p line

# 要素の削除②
p line.delete_at(1)
p line

# 要素の検索
line.each do |xy|
  p xy.include?('2')
end

# 要素の長さ
p line.length
line.each.with_index do |xy, index|
  p "index:#{index} length:#{xy.length}"
end

# 昇順でループ
0.upto(line.length - 1) do |i|
  p line[i]
end

# 降順でループ
line.length - 1.downto(0) do |i|
  p line[i]
end
