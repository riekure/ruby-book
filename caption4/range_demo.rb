# ..を使うと5が範囲に含まれる（1以上5以下）
range = 1..5
p range.include?(1)
p range.include?(4.9)
p range.include?(5)
p range.include?(6)

range = 1...6
p range.include?(0)
p range.include?(1)
p range.include?(4.9)
p range.include?(5)
p range.include?(6)
(1..5).include?(1)

# n以上m以下、n以上m未満の判定をする
def liquid?(temperature)
  # 0度以上100度未満であれば液体、と判定したい
  (0...100).include?(temperature)
end
p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

# case文で使う
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
p charge(3)
p charge(12)
p charge(16)
p charge(25)

# 値が連続する配列を作成する
p (1..5).to_a
p (1...5).to_a
p ('a'..'e').to_a
p ('a'...'e').to_a
p ('bad'..'bag').to_a
p ('bad'...'bag').to_a

# 4.5.5 繰り返し処理を行う
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
p sum

(1..4).each { |n| sum += n }
p sum

numbers = []
(1..10).step(2) { |n| numbers << n }
p numbers


