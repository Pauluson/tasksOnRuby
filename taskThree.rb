# frozen_string_literal: true

print 'Input three side:'

a = gets.chomp.to_i

b = gets.chomp.to_i

c = gets.chomp.to_i

if (a == b) && (b == c) && (a == c)
  print 'Your triangle equilateral'

elsif (a == b) || (b == c) || (a == c)
  print 'Your triangle isosceles'

elsif a * a == b * b + c * c
  print 'Your triangle rectangular'

elsif b * b == a * a + c * c
  print 'Your triangle rectangular'

elsif c * c == a * a + b * b
  print 'Your triangle rectangular'

else
  print 'Your triangle versatile'
end
