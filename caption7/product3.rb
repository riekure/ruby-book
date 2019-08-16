class Product
  DEFAULT_PRICE = 0
  # 再代入して定数の値を書き換える
  DEFAULT_PRICE = 1000

  # 配列、ハッシュ
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze
  # mapメソッドで各要素をfreezeし、最後にmapメソッドの戻り値の配列をfreezeする
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze
  SOME_PRICES = { 'Foo' => 1000, 'Bar' => 2000, 'Baz' => 3000 }

end

# 再代入後の値が返る
p Product::DEFAULT_PRICE

# クラスの外部からでも再代入が可能
Product::DEFAULT_PRICE = 3000
p Product::DEFAULT_PRICE

# クラスを凍結する
Product.freeze
# Product::DEFAULT_PRICE = 4000
# c:/Ruby25-x64/ruby-book/caption7/product3.rb:19:in `<main>': can't modify frozen #<Class:Product> (FrozenError)

# 配列に新しい要素を追加する→freezeしている配列に対しては変更できない
p Product::SOME_NAMES
Product::SOME_NAMES << 'Hoge'
# c:/Ruby25-x64/ruby-book/caption7/product3.rb:24:in `<main>': can't modify frozen Array (FrozenError)
