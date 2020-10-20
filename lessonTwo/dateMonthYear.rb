# frozen_string_literal: true

print 'Day,Mouth,Year:'

m = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

day = gets.chomp.to_i
mouth = gets.chomp.to_i
year = gets.chomp.to_i

count_of_days = 0

(1..mouth - 1).each do |i|
  count_of_days += m[i]
end
count_of_days += day

if (year % 100).zero? && (year % 400).zero?
elsif (year % 4).zero?
  count_of_days += 1
end

print count_of_days
