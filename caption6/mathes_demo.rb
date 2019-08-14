text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
？？：9999-99-9999
？？：03(1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
numbers = text.scan(/0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/)
# => ["03(1234)5678", "03(1234-5678"]
p numbers.grep(/\(\d+\)|-\d+-/)
# => ["03(1234)5678"]


text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

p text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)
# => ["クープバゲットのパンは美味しかった。", "今日はクープ バゲットさんに行きました。", "クープ　バゲットのパンは最高。", "また行きたいです。クープ・バゲット。", "クープ・バケットのパン、売り切れだった（><）"]

html = <<-HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

puts replaced
# <select name="game_console">
# none,
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ
# </select>

text = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
     
hello('Bob')
	
hello('Carol')
TEXT

puts text.gsub(/^[ \t]+$/, '')
# def hello(name)
#   puts "Hello, #{name}!"
# end
# 
# hello('Alice')
# 
# hello('Bob')
# 
# hello('Carol')

if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end
#=> マッチしました

text = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
p m[0]
p m[1]
p m[2]
p m[3]
p m[2,2]  # キャプチャの2番目から2個取得する
p [-1]    # 最後のキャプチャを取得する
p m[1..3] # Rangeを使って取得する
p /(\d+)年(\d+)月(\d+)日/.match('foo') # nil

# 6.3.3 キャプチャの結果に名前を付ける
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
p m[:year]
p m[:month]
p m[:day]

# 左辺と右辺を逆にするとエラー
# 正規表現オブジェクトをいったん変数に入れたりする場合も使用できない
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end

# 6.3.4 正規表現と組み合わせると便利なStringクラスのメソッド
p '123 456 789'.scan(/\d+/)
p '1977年7月17日 2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)

text = '郵便番号は123-4567です'
p text[/\d{3}-\d{4}/]
text = '誕生日は1977年7月17日です'
p text[/(\d+)年(\d+)月(\d+)日/, 3]
# シンボルでキャプチャの名前を指定する
p text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day]
# 文字列でキャプチャの名前を指定する
p text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day']

text = '郵便番号は123-4567です'
p text.slice!(/\d{3}-\d{4}/)
text = '誕生日は1977年7月17日です'
p text.slice(/(\d+)年(\d+)月(\d+)日/, 3)
text.slice!(/(\d+)年(\d+)月(\d+)日/)
p text

# split
text = '123,456-789'
# 文字列で区切り文字を指定する
p text.split(',')
p text.split(/,|-/)

text = '123,456-789'
# 第一引数に文字列を渡すと、完全一致する文字列を第2引数で置き換える
text.gsub(',',':')
# 正規表現を渡すと、マッチした部分を第2引数で置き換える
text.gsub(/,|-/,':')

text = '誕生日は1977年7月17日です'
p text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-3')

# 6.5.2 case文で正規表現を使う
text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です。'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です。'
when /^\d+-\d+-\d+$/
  puts '電話番号です。'
end

# 6.5.5 Regexp.last_matchでマッチの結果を取得する
text = '私の誕生日は1977年7月17日です。'

# =~演算子などを使うと、マッチした結果をRegexp.last_matchで取得できる
text =~ /(\d+)年(\d+)月(\d+)日/

# MatchDataオブジェクトを取得する
p Regexp.last_match

# マッチした部分全体を取得する
p Regexp.last_match(0)

# 1番目～3番目のキャプチャを取得する
p Regexp.last_match(1)
p Regexp.last_match(2)
p Regexp.last_match(3)

# 最後のキャプチャを取得する
p p Regexp.last_match(-1)

# 6.5.6 組み込み変数を書き換えないmatch?メソッド
# マッチすればtrueを返す→=~演算子やmatchより高速
p /^\d{3}-\d{4}/.match?('123-4567')
