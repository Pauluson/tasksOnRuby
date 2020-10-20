print 'Input a,b,c:'

a = gets.chomp.to_i

b = gets.chomp.to_i

c = gets.chomp.to_i

puts d = (b * b - 4 * a * c)

print "D = #{d}"

if d < 0
  print "D = #{d} , no solutions "
elsif d == 0
  print "x = #{-b / (2 * a)}"
else (d > 0)
     print "x1 = #{(-b - Math.sqrt(d)) / (2 * a)}, x2 = #{(-b + Math.sqrt(d)) / (2 * a)}"
end
