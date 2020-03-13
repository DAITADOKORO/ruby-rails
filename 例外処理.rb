
  例外処理

  begin #メソッド全体に対する例外処理の場合、 beginを　defメソッド名　に置き換え
    (例外が発生するかもしれないコード)
  rescue
    (例外に対応するコード)
  ensure
    (例外が発生してもしなくても必ず実行したいコード)
  end


 rescue例

  rescue SomeSpecialError => e
    puts "#{e.class}(#{e.message})が発生しました。処理を続行します。"
# rescue => e でも可（捕捉するのはStandardErrorおよびその子クラスの例外）
