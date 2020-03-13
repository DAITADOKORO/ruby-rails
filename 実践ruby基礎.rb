その他

 def name=(name) #セッター。インスタンス変数を代入するためのメソッドname=のこと。
  @name = name
 end

 def name #ゲッター。インスタンス変数の内容を参照するためのメソッド。
  @name
 end

 attr_accessor :name, :address #ゲッターとセッターをこれ一文で実現できる
 attr_reader :name #ゲッターのみ
 attr_writer :name #セッターのみ
  test = Test.new
  test.name = '山田'
  => '山田' #といった具合に保存できるように。

  attr_reader :name, :address
  def initialize(name, address)
#rubyのオブジェクトをnewメソッドで生成するとき実行されるinitializeメソッドの中身。
    @name = name
    @address = address
  end


"#{name}" #text中などに引っ張って来たデータを反映させるために。
          #シングルクォーテーションだとそのまま文字列が返ってくるためNG

  return if !value #valueがnilかfalseなら以降の処理をしない
  return if value.nil? #nil単品版

super #親クラスの同名メソッドを実行

nilガード

number || = 10
number || (number = 10)
# もしnumberがあればnumber,なければnumber=10になる。どっちも同じ。
def children
  @children || = [] #ゲッターメソッドの中身が空っぽになるのを防げる。

ぼっち演算子
object = nil
object&.name #空っぽだけど、エラーではなくnilと返してくれる。
name = object&.name #簡潔にデータありとnilの場合を一括保存。

％記法

array = ['a', 'b', 'c']
array = %w(a b c) # %wで文字列

symbol = [:a, :b, :c]
symbol = %i(a, b, c) #%iでシンボル

条件文

unless age > 20 #忘れがちなunlessさん。elseはあるけどelsifはない。

puts 'hello' if true #後置きif。trueかfalse。１行分の処理のみに使う。



配列

a = [1,2,3]

a.each do |element|
  puts element
end

for element in a
  puts element
end
# 上記の二つは同じ

a << 4 #配列に要素を追加する

ハッシュ
options = { tokyo: 1, kanagawa: 2 }
puts options[:tokyo]
options[:niigata] = 3 #ハッシュに追加

options.each do |key, value|
  puts key
  puts value
end
# キーと値をeach文で回して取得できる

# 数字がキー { 11 => 1 }
# 文字列がキー { "tokyo" => 1 }
# ハッシュロケットの代わりにコロン　{"tokyo" : 1 }
# シンボルがキー { :tokyo => 1 }
# ハッシュロケットの代わりにコロン　{ tokyo: 1 } 一番メジャー

マップメソッド
names = users.map do |user| #mapメソッドは配列の各要素に対してブロックを実行した結果を格納した新しい配列に返す。
  user.name
end
names = users.map {|user| user.name }
names = users,map(&:name) #全部一緒


モジュール　#部分的な設計書。複数の似たクラスを作る際に。

module Chatting #モジュールを定義。Chatting.newでオブジェクト生成はできない
  def method_name
  end
end

class Dog
  include Chatting #Dogクラスに取り込み。Dog.newからのDog.method_nameで中の記述を読み込む。
end
