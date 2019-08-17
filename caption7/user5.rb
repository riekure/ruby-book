# 7.10.1 エイリアスメソッドの定義
class User
  def hello
    'Hello'
  end

  # helloメソッドのエイリアスメソッドとしてgreetingを定義する
  alias greeting hello

  # freezeメソッドの定義を削除する
  undef freeze

  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

user = User.new
p user.hello
p user.greeting

# freezeメソッドを呼び出すエラーになる
# user.freeze

blood_type = User::BloodType.new('B')
p blood_type.type
