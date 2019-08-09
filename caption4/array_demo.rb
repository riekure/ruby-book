a = [1, 2, 3]
p a[100]
p a.size
p a.length

# 4.2.1. 要素の変更、追加、削除
a[4] = 50
p a
a.delete_at(3)
p a
p a.delete_at(100)

# 4.2.2 配列を使った多重代入
a, b = [1, 2]
p a
p b
c, d = [10]
p c
p d
e, f = [100, 200, 300]
p e
p f

# 割り算の商とあまりを配列として返す
p 14.divmod(3)
# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
p "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}"

# 4.7.1 さまざまな要素の取得方法
a = [1, 2, 3, 4, 5]
p a[1, 3]
p a.values_at(0, 2, 4)
p a[a.size - 1]
p a[-1]
p a[-2]
p a[-2, 2]
p a.last
p a.last(2)
p a.first
p a.first(2)
