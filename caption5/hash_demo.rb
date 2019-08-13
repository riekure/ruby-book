currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

currencies.delete('japan')
puts currencies.delete('italy') {
  |key| "Not found: #{key}"
}

currencies.each do |key, value|
  puts "#{key} : #{value}"
end

# シンボルはイミュータブルなので、破壊的な変更は不可能
symbol = :apple
# symbol.upcase!
# c:/Ruby25-x64/ruby-book/caption5/hash_demo.rb:14:in `<main>': undefined method `upcase!' for :apple:Symbol (NoMethodError)

# 5.4.1 ハッシュキーにシンボルを使う
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }

puts currencies[:us] 

currencies.each do |key, value|
  puts "#{key} : #{value}"
end

def buy_burger(menu, drink: true, potato: true)
  if drink
    puts 'drink'
  end
  if potato
    puts 'potato'
  end
end

buy_burger('cheese', drink: true, potato: true)
buy_burger('fish', drink: true, potato: false)
buy_burger('cheese')
# 順番を変えることもできる
buy_burger('cheese', potato: false, drink: true)

def buy_burger2(menyu, drink:,potato:)
  # 省略
end

p currencies.keys
p currencies.values

p currencies.has_key?(:japan)
p currencies.has_key?(:italy)

h = {us: 'dollar', india:'rupee'}
# 同義
{japan: 'yen', **h}
{ japan: 'yen' }.merge(h)

# 5.6.3 ハッシュを使った疑似キーワード引数
def buy_burger3(menu, options = {})
  drink = options[:drink]
  potato = options[:potato]
  p drink
  p potato
end

buy_burger3('cheese', drink: true, potato: false)

# 5.6.4 任意のキーワードを受け付ける**引数
def buy_burger4(menu, drink: true, potato: true, **others)
  # otherはハッシュとして渡される
  puts others
end

buy_burger4('fish', drink: true, potato: false, salid: true, chicken: false)

# 5.6.5 メソッド呼び出し時の{}の省略
def buy_burger5(menu, options = {})
  puts options
end

# ハッシュを第2引数として渡す
# 最後の引数でなければ{]をつけて普通にハッシュを作成する
buy_burger5('fish', {'drink' => true, 'potato' => false})
buy_burger5('fish', 'drink' => true, 'potato' => false)
# ハッシュが最後の引数なので、{}を省略することもできる
buy_burger5 'fish', 'drink' => true, 'potato' => false

# 5.6.7 ハッシュから配列へ、配列からハッシュへ
array = currencies.to_a
p array
array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
p array.to_h

# 5.6.8 配列の初期値を理解する
h = {}
p h[:foo]
h = Hash.new('hello')
a = h[:bar]
b = h[:foo]
p a.equal?(b)
# 破壊的な変更を適用すると、bも一緒に変わってしまう
a.upcase!
p a
p b
# ハッシュ自信は空のまま
p h

# 初期値を返すだけでなく、ハッシュに指定されたキーと初期値を同時に設定する
h = Hash.new { |hash, key| hash[key] = 'hello'}
p h[:foo]
p h[:bar]
p h