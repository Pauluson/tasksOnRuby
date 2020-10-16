backet={}
loop do
print "Input name of product:"
product = gets.chomp
break if product=="stop"
print "Input price for one product:"
price = gets.chomp.to_i
print "Input number of product:"
number = gets.chomp.to_f
backet[product] = {price => number}
end


puts backet


