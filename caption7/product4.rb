# 7.9.2 クラス変数
class Product
  @@name = 'Prodct'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラスを定義したタイミングで@@nameが"DVD"に変更される
p Product.name
p DVD.name

product = Product.new('A great movie')
p product.name

# Product.newのタイミングで@@nameが"A great movie"に変更される
p Product.name
p DVD.name

dvd = DVD.new('An awesome film')
p dvd.name
p dvd.upcase_name

# DVD.newのタイミングで@@nameが"An awesome film"に変更される
p product.name
p Product.name
p DVD.name
