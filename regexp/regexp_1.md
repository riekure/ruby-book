# 1. 電話番号を探す

[Rubular](https://rubular.com/)
[Online regex tester and debugger: PHP, PCRE, Python, Golang and JavaScript](https://regex101.com/)

```
名前：伊藤淳一
電話1：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
電話2：03-1234-5678
```

```
\d\d-\d\d\d\d-\d\d\d\d
```

```ruby
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
p text.scan /\d\d-\d\d\d\d-\d\d\d\d/

# => ["03-1234-5678", "03-1234-5678"]
```

\dは「1個の半角数字」
\d\dは「2個の半角数字」という意味。

# 2. いろんな市街局番に対応させる

```
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
```

```
\d{2,5}-\d{1,4}-\d{4}
```

```ruby
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT
p text.scan /\d{2,5}-\d{1,4}-\d{4}/

# => ["03-1234-5678", "090-1234-5678", "0795-12-3456", "04992-1-2345"]
```

{n,m}は「直前の文字がn個以上、m個以下という意味。
{n}とすれば、「ちょうどn文字」という意味。

# 3. ハイフンだけでなく、カッコにも対応させる

```
名前：伊藤淳一
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
電話：9999-99-9999
住所：兵庫県西脇市板波町1-2-3
```

```
\d{2,5}[(-]\d{1,4}[)-]\d{4}
```

[ABC]とすれば、「AまたはBまたはCのいずれか1文字」という意味。
[a-z]とすれば、「aまたはbまたはcまたは・・・z」という意味。
[0-9]とすれば、「0または1または2または・・・9」という意味。

# 4. 電話番号の1文字目はゼロ、2文字目はゼロ以外の半角数字

```
0[1-9]\d{0,3}[(-]\d{1,4}[)-]\d{4}
```

```ruby
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT
p text.scan /0[1-9]\d{0,3}[(-]\d{1,4}[)-]\d{4}/
```

# 5. カタカナ語の表記ゆれを許容する

```
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
```

## 様々な区切り文字を許容する

```
クープ[ 　・]バゲット
```

## 濁点の有無を許容する

```
クープ[ 　・]バ[ケゲ]ット
```

## 区切り文字の有無を許容する

```
クープ[ 　・]?バ[ケゲ]ット
```

「～が1文字、またはなし」を表現するためには？というメタ文字を使用する

## 区切り文字を簡易的に表現する

```
クープ.?バ[ケゲ]ット
```

「任意の1文字」を表す.というメタ文字を使用する

```ruby
text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)
# => ["クープバゲットのパンは美味しかった。", "今日はクープ バゲットさんに行きました。", "クープ　バゲットのパンは最高。", "また行きたいです。クープ・バゲット。", "クープ・バケットのパン、売り切れだった（><）"]
```

# 6. HTMLタグをCSVに変換する

```
<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
```

## 6.1 valueを抜き出す正規表現を考える

「value=、ダブルクオート、英数字またはアンダースコアが1文字以上、ダブルクオート」
アスタリスクは、直前の文字を0回以上の繰り返しを表現
プラスは、直前の文字を1回以上の繰り返しを表現

```
value="[a-z0-9_]+"
```

## 6.2 表示テキストを抜き出す正規表現を考える

「何かしらの文字が続く」は、```.```と```*```で実現できる

```
>.+<
```

## 6.3 行全体にマッチする正規表現を作る

optionの各行全体がマッチする正規表現

```
<option value="[0-9a-z_]+">.+<\/option>
```

valueと表示テキストを```()```で囲む

```
<option value="([0-9a-z_]+)">(.+)<\/option>
```

```
Match 1
1.  wii_u
2.  Wii U
Match 2
1.  ps4
2.  プレステ4
Match 3
1.  gb
2.  ゲームボーイ
```

## 6.4 キャプチャを利用して新しい文字列を組み立てる

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/aba433e9-59de-8957-4a6b-369f6d5dd6ce.png)

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/debcb11f-a711-4c45-d2de-be10276b5214.png)

```
<option value="([0-9a-z_]+)">(.+)<\/option>
$1,$2
```

## 6.5 表示テキストがないoptionも置換できるようになる

```
<select name="game_console">
<option value="none"></option>
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
```

```+```を```*```に変更して、「直前の文字が0文字以上」を表す

```
<option value="([0-9a-z_]*)">(.*)<\/option>
```

## 6.6 selectedになっているoptionも置換できるようにする

「"selected"があり、またはなし」というOR条件を追加する

```
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
```

```
<option value="([0-9a-z_]*)"( selected)?>(.*)<\/option>
```

```
Match 1
1.	none
2.	 
3.	 
Match 2
1.	wii_u
2.	selected
3.	Wii U
Match 3
1.	ps4
2.	 
3.	プレステ4
Match 4
1.	gb
2.	 
3.	ゲームボーイ
```

( selected)?の部分もキャプチャされて1,2,3になっていることが問題。
キャプチャする必要がない```()```は```(?:)```とすると、キャプチャ対象から除外できる

```
<option value="([0-9a-z_]*)"(?: selected)?>(.*)<\/option>
```

こうすれば、キャプチャできる文字列が2個に戻る

```
Match 1
1.	none
2.	 
Match 2
1.	wii_u
2.	Wii U
Match 3
1.	ps4
2.	プレステ4
Match 4
1.	gb
2.	ゲームボーイ
```

## 6.7 [0-9]を\dに置き換える

```[a-z0-9_]+``` は ```[a-z\d_]+``` に置き換えることができる

```
<option value="([a-z\d_]*)"(?: selected)?>(.*)<\/option>
```

## 6.8 [a-z\d_]を\wに置き換える

```
<option value="(\w*)"(?: selected)?>(.*)<\/option>
```

```ruby
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
```

「> で始まり、任意の文字が0個以上連続し（.*）、< で終わる」という意味。

## 6.9 「任意の1文字」よりも厳しい条件を指定する

「＜以外の任意の文字」

```
<option value="(\w*)"(?: selected)?>(.*)<\/option>
↓
<option value="(\w*)"(?: selected)?>([^<]*)<\/option>
```

# 7. スペースやタブ文字の入った空行を見つける

```ruby
def hello(name)
  puts "Hello, #{name}!"
end

hello('Alice')
          
hello('Bob')
	
hello('Carol')
```

```
^[ \t]+$
```

# 8. 行末に入った無駄なスペースを見つける

```ruby
def hello(name)   
  puts "Hello, #{name}!"
end      
```

```
[ \t]+$
```

# 9. インデントがガタガタになったテキストを左寄せにする

```ruby
  Lorem ipsum dolor sit amet.
Vestibulum luctus est ut mauris tempor tincidunt.
         Suspendisse eget metus
      Curabitur nec urna eget ligula accumsan congue.
```

```
^[ \t]+
```

# 10.  不揃いなスペースを揃える

```json
{
  japan:	'yen',
  america:'dollar',
  italy:     'euro'
}
```

```
:[ \t]*
```

## 10.1 [ \t]の代わりに\sを使ってみる

```\s``` は、半角スペースやタブ文字、改行文字など、目に見えない「空白文字全般」を表す文字
言語や環境によって、 \s に含まれる文字が微妙に異なる

# 11. ログから特定の文字を含む行を削除する

```heroku/api``` が含まれる行を選択する

```
Feb 14 07:33:02 app/web.1:  Completed 302 Found ...
Feb 14 07:36:46 heroku/api:  Starting process ...
Feb 14 07:36:50 heroku/scheduler.7625:  Starting ...
Feb 14 07:36:50 heroku/scheduler.7625:  State ...
Feb 14 07:36:54 heroku/router:  at=info method=...
Feb 14 07:36:54 app/web.1:  Started HEAD "/" ...
Feb 14 07:36:54 app/web.1:  Completed 200 ...
```

```
^.+heroku\/api.+$
```

## 11.1 heroku/api の行と heroku/scheduler の行をまとめて選択したい

```
^.+heroku(\/api|\/scheduler).+$
```

まとめるときは```|``` というメタ文字を使用する
```ABC|DEF``` のように書くと、「文字列ABC、または文字列DEF」という OR条件
OR条件の範囲を明確にするためには、(ABC|DEF)のようにグループ化することが多い

## 11.2 空行を残さず削除したい

```
^.+heroku(\/api|\/scheduler).+$\n
```

## 12. 使われる場所によって役割が異なる^を理解する

[]の中で^が使われると「AでもなくBでもない1文字」という否定条件に変更できる

```
ABCDEF
!@#$%^&*
```

「AでもなくBでもない文字1文字」

```
[^AB]
```

「AまたはBまたは^のいずれか1文字」

```
[AB^]
```

# 13. 英単語にぴったりマッチさせる（\bの使い方）

\bというメタ文字は「単語の境界」を表す

```
sounds that are pleasing to the ear.
ear is the organ of the sense of hearing.
I can't bear it.
Why on earth would anyone feel sorry for you?
```

「直前と直後に単語の境界がくる"ear"」

```
\bear\b
```

# 14. 検索性の低いメソッドをきれいに抜き出す（\bの使い方・その2）

```html
<td>
<%= link_to I18n.t('.show'), user %>
<%= link_to t('.edit'), edit_user_path(user) %>
</td>
```

tメソッドを呼び出している部分のみを抜き出している

```
\bt\b
```

# 15. ファイル名だけをピタリと抜き出す（肯定の後読み）

```
type=zip; filename=users.zip; size=1024;
type=xml; filename=posts.xml; size=2048;
```

；以外の任意の文字1文字以上。
（）でキャプチャをつけると、ファイル名のみ抽出できる

```
filename=([^;]+)
```

(?<=abc)のように書くと、"abc"という文字列そのものではなく、その文字列の「直後の位置」（abcであればcの直後）にマッチする。
これを（肯定の）後読みという。

```
(?<=filename=)
```

「"filename="という文字列の直後から始まって、";"以外の文字が1文字以上続く」

```
(?<=filename=)[^;]+
```

後読みや先読みを使うと便利なのは、Rubyのscanメソッドや、JavaScriptのmatchメソッドを使用するとき。

```ruby
text = <<-TEXT
type=zip; filename=users.zip; size=1024;
type=xml; filename=posts.xml; size=2048;
TEXT
p text.scan(/(?<=filename=)[^;]+/)
# => ["users.zip", "posts.xml"]
```

後読みを使わない場合は、下記になるので面倒。

```ruby
text = <<-TEXT
type=zip; filename=users.zip; size=1024;
type=xml; filename=posts.xml; size=2048;
TEXT
text.scan(/filename=[^;]+/).map { |s| s.split('=').last }
# => ["users.zip", "posts.xml"]
```

# 16. 特定の楽器を担当しているメンバーを抜き出す（肯定の先読み）

```
John:guitar, George:guitar, Paul:bass, Ringo:drum
Freddie:vocal, Brian:guitar, John:bass, Roger:drum
```

先読みを使わないと、下のようになる

```
\w+:bass
```

先読みを使うと、「":bass"という文字列の直前になる、1文字以上続く英単語の構成文字」

```
\w+(?=:bass)
```

```ruby
text = <<-TEXT
John:guitar, George:guitar, Paul:bass, Ringo:drum
Freddie:vocal, Brian:guitar, John:bass, Roger:drum
TEXT
p text.scan(/\w+(?=:bass)/)
# => ["Paul", "John"]
```

# 17. 間違った都道府県名を見つける（否定の後読み）

```
東京都
千葉県
神奈川県
埼玉都
```

(?<!abc)のように書くと、"abc"という文字列以外の「直後の位置」にマッチする
これを否定の後読みという。


```
(?<!東京)都
```

# 18. 「食べ物のサザエ」を見つける（否定の先読み）

```
つぼ焼きにしたサザエはおいしい
日曜日にやってるサザエさんは面白い
```

(?!abc)のように書くと、"abc"という文字列以外の「直前の位置」にマッチする

```
サザエ(?!さん)
```

# 19. URLがそのまま画面上に表示されているリンクを見つける（後方参照）

```html
<a href="http://google.com">http://google.com</a>
<a href="http://yahoo.co.jp">ヤフー</a>
<a href="http://facebook.com">http://facebook.com</a>
```

正規表現内で使われている\1は、「（）でキャプチャされた1番目の文字列」を表す。
つまり、(.+?)と\1は同じ文字列を指すことになる。

```
<a href="(.+?)">\1<\/a>
```

# 20. ツイート、アカウント、ツイート日時を抽出する（メタ文字の複雑な組み合わせ）

```
You say yes. - @jnchito 8s
I say no. - @BarackObama 12m
You say stop. - @dhh 7h
I say go go go. - @ladygaga Feb 20
Hello, goodbye. - @BillGates 11 Apr 2015
```

```
^(.*) - (@\w*) (.*)$\n
```

# 20.1 ツイートを抜き出す

行頭からハイフンまでの任意の文字列

```
^(.*) - 
```

# 20.2 アカウントを抜き出す

"@"で始まり、任意のアルファベットが続く文字列
アルファベットに限定せず、「英単語を構成する文字」であればOK
なので、\wを使用する

```
(@\w+)
```

# 20.3 ツイート日時（秒、分、時間）を抜き出す

数秒、数分、数時間のケース
「数字 + s/m/h」というパターン

```
(\d+[smh])
```

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/d4836ba5-cf4b-2d8a-f4fb-c2554b46f7cd.png)


# 20.4 ツイート日時（1日以上前）を抜き出す

アルファベット3文字 + 数字

```
(\w{3} \d+)
```

無駄にキャプチャしすぎ
もう少し厳密な「大文字1文字 ＋ 小文字2文字」

```
[A-Z]{1}[a-z]{2}\s\d+
```

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/4f7f9f49-f68e-9617-0482-cab835c91f2c.png)

# 20.5 ツイート日時（1年以上前）を抜き出す

「数字 + アルファベット3文字 + 数字」
?:はキャプチャしないという意味
アルファベット3文字の前の数字がくるかどうかなので、「（アルファベットの前に）数字あり、またはなし」にすればOK

```
((?:\d+ )?[A-Z]{1}[a-z]{2} \d+)
```

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/6281413a-53b0-d842-7a75-f89c1583da22.png)


```(?:\d+ )?``` の部分が「数字あり、またはなし」の正規表現

# 20.6 すべての日時を一度に抜き出す

- 秒、分、時間の場合 = ```(\d+[smh])```
- 1日以上前、1年以上前の場合 = ```((?:\d+ )?[A-Z][a-z]{2} \d+)```

これを単純にOR条件で結合すればOK

```
(\d+[smh]|(?:\d+ )?[A-Z]{1}[a-z]{2} \d+)
```

# 20.7 仕上げ：ツイート、アカウント、日時を一気に抜き出す

- ツイート = ```^(.*) - ```
- アカウント = ```(@\w+)```
- ツイート日時 = ```(\d+[smh]|(?:\d+ )?[A-Z][a-z]{2} \d+)```

正規表現を連結する

```^(.*) - (@\w+) (\d+[smh]|(?:\d+ )?[A-Z]{1}[a-z]{2} \d+)```

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/233011/19a2fb84-4653-211d-e6dd-d74e5a1064f4.png)
