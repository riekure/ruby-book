# グローバル変数の宣言と値の代入
$program_name = 'Awesome program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameにはすでに名前が代入されている
p Program.name

program = Program.new('Super program')
p program.name

# Program.newのタイミングで$program_nameが"Super program"に変更される
p Program.name
p $program_name
