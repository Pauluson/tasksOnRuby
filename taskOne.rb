# frozen_string_literal: true

print 'Enter your name:'

name = gets.chomp

print 'Enter you hight:'

height = gets.chomp.to_i

if (weight = (height - 110) * 1.15).positive?
  print " #{name} your wight is good "
else
  print " #{name} your are fat"
end
