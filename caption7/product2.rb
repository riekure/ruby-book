# 7.7.3 privateメソッドはサブクラスでも呼び出せる
class Product
  private 
  # これはprivateメソッド
  def name
    'A great movie'
  end
end

class DVD < Product
  def to_s
    # nameはスーパークラスのprivateメソッド
    "name: #{name}."
  end
end

dvd = DVD.new
# 内部でスーパークラスのprivateメソッドを呼んでいるがエラーにはならない
p dvd.to_s

