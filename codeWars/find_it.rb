# 課題: 整数からなるリストが与えられます。リストに奇数個しか含まれない要素がただ一つあります。それを求めなさい。
# 入出力例: find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) -> 5 (5以外の要素はどれも偶数個含まれている)
def find_it(arr)
  # arr.inject(:^)
  arr.each do |i|
    if arr.count(i).odd?
      return i
    end
  end
end
