class User
  def initialize(name)
    @name = name
  end

  def hello
    p "Hello, #{@name}!"
  end
end

# モンキーバッチをあてる前の挙動を確認する
user = User.new('Alice')
user.hello

# helloメソッドにモンキーバッチをあてて独自の挙動をもたせる
class User
  def hello
    p "#{name}さん、こんにちは！"
  end
end

# メソッドの定義を上書きしたのでhelloメソッドの挙動が変わっている
user.hello
