# ログ出力用のメソッドを提供するモジュール
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # Loggableモジュールのメソッドを特異メソッド（クラスメソッド）としてミックスインする
  extend Loggable

  def self.create_products(names)
    # logメソッドをクラスメソッド内で呼び出す
    # (つまりlogメソッド自体もクラスメソッドになっている)
    log 'create_products is called.'
  end
end

# クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([])

# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product.log('Hello.')
