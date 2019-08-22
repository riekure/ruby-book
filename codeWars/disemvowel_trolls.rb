# 課題: 与えられた文字列から母音だけを除いた文字列を返す関数を書きなさい。
# 入出力例: disemvowel("This website is for losers LOL!") -> "Ths wbst s fr lsrs LL!"
def disemvowel(n)
  n.gsub(/[AIUEOaiueo]/, '')
end