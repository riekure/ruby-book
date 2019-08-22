# 課題: 与えられた整数が平方数かどうかをTrueまたはFalseで判定する関数を書きなさい。
# 入出力例: is_square(-1) -> False
def is_square(n)
  n >= 0 && Math.sqrt(n) == Math.sqrt(n).to_i
end