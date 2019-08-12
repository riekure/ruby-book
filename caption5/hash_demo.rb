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
