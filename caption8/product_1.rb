# ログ出力用のメソッドを提供するモジュール
module Loggable
  # logメソッドはprivateメソッドにする
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # 上で作ったモジュールをincludeする
  include Loggable

  def title
    # logメソッドはLoggableモジュールで知恵ぎしたメソッド
    log 'title is called.'
    'A great movie'
  end
end

class User
  # こちらも同じようにincludeする
  include Loggable

  def name
    # Loggableモジュールのメソッドが使える
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
p product.title

user = User.new
p user.name

product.log 'public?'
