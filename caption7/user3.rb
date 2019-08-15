class User
  def initialize(name)
    @name = name
  end

  # self.を付けるとクラスメソッドになる
  def create_users(names)
    names.map do |name|
      User.new(name)
    end
  end


  # これはインスタンスメソッド
  # デフォルトはpublic
  def hello
    # selfなしでnameメソッドを呼び出す
    # selfをつけるとエラーになる
    "Hello, I am #{name}."
  end

  # ここから下で定義されたメソッドはprivate
  private
  def hello_private
    'Hello!!'
  end

  def name
    'Alice'
  end

  # クラスメソッドはprivateメソッドにはならない
  def self.hello_class
    'Hello'
  end

  # class << selfの構文ならクラスメソッドでもprivateが機能する
  class << self
    private
    def self.hello_class_self
      'Hello!!!'
    end
  end

  # privateメソッドから先に定義する場合、public宣言すると、publicメソッドになる
  public
  def bar
    'BAR!!!!'
  end

  # private :bar
end

p User.hello_class
# p User.hello_class_self
user = User.new('Alice')
p user.hello
p user.bar
p user.hello_private
