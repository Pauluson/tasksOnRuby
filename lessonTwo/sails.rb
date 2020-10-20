# frozen_string_literal: true

# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# аполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
backet = {}
result = 0

loop do
  print 'Input name of product:'
  product = gets.chomp
  break if product == 'stop'

  print 'Input price for one product:'
  price = gets.chomp.to_i
  print 'Input number of product:'
  number = gets.chomp.to_f
  backet[product] = { price => number }
end
backet.each do |product, price|
  puts "#{product}:#{price.keys.first * price.values.first}"
  result += price.keys.first * price.values.first
end

puts "Total:#{result}"
