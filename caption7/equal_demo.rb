# equal?
a = 'abc'
b = 'abc'
p a.equal?(b)

c = a
p a.equal?(c)

# ==
p a == b
p 1 == 1.0

# eql?
# ハッシュのキーとして2つのオブジェクトが等しいかどうか
# ハッシュ上では1と1.0は別々のキーとして扱われる
h = { 1 => 'Integer', 1.0 => 'Float' }
p h[1]
p h[1.0]

# 異なるキーとして扱われるのは、eql?メソッドで比較したときにfalseになるため
p 1.eql?(1.0)


a = 'japan'
b = 'japan'
# eql?が真ならば、hash値も同じ
p a.eql?(b)
p a.hash
p b.hash

c = 1
d = 1.0
# eql?が偽ならば、hash値も異なる
p c.eql?(d)
p c.hash
p d.hash

# ===
# case文のwhenで使われる
text = '03-1234-5678'
case text
  # 内部的に=== textとなっている
when /^\d{3}-\d{4}$/
  puts '郵便番号です。'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です。'
when /^\d+-\d+-\d+$/
  puts '電話番号です。'
end
