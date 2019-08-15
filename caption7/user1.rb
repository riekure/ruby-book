class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}"
  end

  # インスタンスメソッドの定義
  def hello
    "Hello, I am #{@first_name}."
  end
end

# ユーザのデータを作成する
users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

# ユーザのデータ表示する
users.each do |user|
  puts "氏名: #{user.full_name}、年齢： #{user.age}"
end

# インスタンスメソッドの呼び出し
p users[0].hello
