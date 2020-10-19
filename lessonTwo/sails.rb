# frozen_string_literal: true

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
backet.each do |_product|
  result += price.keys.first * price.values.first
end

puts result
