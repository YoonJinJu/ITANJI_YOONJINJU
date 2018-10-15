# 変数正義 - お金
one         = 1
five        = 5
ten         = 10
fifty       = 50
hundred     = 100
fivehundred = 500
thousand    = 1000

# その他
sum           = 0
selling_price = 0

# Array
ProductList = [
  {
    name: "Cola",
    price: 120,
    count: 5
  },
  {
    name: "RedBule",
    price: 200,
    count: 5
  },
  {
    name: "Water",
    price: 100,
    count: 5
  }
]

ProductCount = ProductList.length()-1;

puts "こんにちは！ジンジュの自動販売機です。"

# 何度もお金を入れることができます。
while true
  puts "-----　お金を入れてください。-----"
  input = gets.to_i

  # 1円と５円はお釣りに。
  if input == one || input == five
      puts "** 1円と５円は使いません。**"
      change = input.to_i
      puts "お釣りです。: " + change.to_s

      #お釣りをくれましたから０です。
      change = 0
  else
    sum   = sum + input
    puts  "　入れたお金　" + sum.to_s

    #お金を入れた場合
    puts "----- 1番入力し、商品を選択　-----"
    puts "----- 2番入力し、お釣りをもらう　-----"
    selectNum = gets.to_i

    #商品選択
    if selectNum == 1
        puts "----- 商品を選択してください。-----"
        puts "番号を入力してください。"

        #商品LIST出力
        for i in 0..ProductCount
          if ProductList[i][:count] > 0
              puts "#{i+1}番 : #{ProductList[i][:name]}  価格 : #{ProductList[i][:price]} "
          else
            puts "#{i+1}番 : #{ProductList[i][:name]}  SOLD OUT"
          end

        end

      #商品選択
      num = gets.chomp
      SelectProduct = num.to_i

      #在庫がない場合
      if ProductList[SelectProduct-1][:count] == 0
        puts "この商品の在庫がありません。すみませんが、他の商品を利用してください。"

      #お金が足りない場合
      elsif sum < ProductList[SelectProduct-1][:price]
        puts "お金が足りません。お金を入れてください。"

      else
        puts ProductList[SelectProduct-1][:name]
        puts "商品が出ました。"

        #入れたお金 - 商品の価格
        sum    = sum - ProductList[SelectProduct-1][:price];
        change = sum

        #在庫を一つ減らします。
        NowCount = ProductList[SelectProduct-1][:count] - 1
        ProductList[SelectProduct-1][:count] = NowCount
        puts  "この商品在庫は #{ProductList[SelectProduct-1][:count]} です。"
        puts "お釣りです。:" + change.to_s

        #販売した金
        selling_price = selling_price + ProductList[SelectProduct-1][:price]

        if sum == 0
          break
        end
      end
      #お釣り
      elsif selectNum == 2
        change = sum

        puts "お釣りです。:" + change.to_s
        break
    end
  end
end

#全部の情報を見られる
puts " "
puts "**************************************** "
puts " "
puts "----- 販売後商品のLISTです。-----"
for i in 0..ProductCount
  if ProductList[i][:count] > 0
      puts "#{i+1}番 : #{ProductList[i][:name]}  価格 : #{ProductList[i][:price]}  在庫 : #{ProductList[i][:count]} "
  end
end
puts " "
puts "----- 今日の売上 -----"
puts selling_price
