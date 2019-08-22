# 課題: 1から与えられた正の整数までの整数の総和を答える関数を書きなさい。
# 入出力例: summation(8) -> 36 (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8)
def summation_a(n)
  sum = 0
  1.upto(n) do |x| sum += x end
  sum
end

def summation_b(n)
  (1..n).inject(:+)
end

def summation_c(n)
  (1..n).sum
end

def summation_d(n)
  n * (n + 1) / 2
end