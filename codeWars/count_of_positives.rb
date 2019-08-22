# 課題: 与えられたリストのうち正の要素の個数と、負の要素の総和を答える関数を書きなさい。
# 入出力例: count_positives_sum_negatives[1, 2, 3, 4, -5, -6, -7] -> [4, -18]
# 制約: 要素数が0のリストが与えられたときは[]を返してください。
def count_positives_sum_negatives(arr)
  return [] if arr.empty?

  pos = 0
  neg = 0

  arr.each do |n|
    n > 0 ? pos += 1 : neg += n
  end
  
  [pos, neg]
end