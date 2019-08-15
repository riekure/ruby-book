class User
  # weightは外部に公開しない
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 自分がother_userより重い場合はtrue
  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected :weight

  # protextedメソッドなので同じクラスかサブクラスであればレシーバー付きで呼び出せる
  def weight
    @weight
  end
end
alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

# 同じクラスのインスタンスメソッド内であればweightが呼び出せる
p alice.heavier_than?(bob)
p bob.heavier_than?(alice)

# クラスの外ではweightは呼び出せない
p alice.weight
