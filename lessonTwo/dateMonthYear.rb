print "Day,Mouth,Year:"

m = [31,28,31,30,31,30,31,31,30,31,30,31]

day=gets.chomp.to_i
mouth=gets.chomp.to_i
year=gets.chomp.to_i

qty=0

for i in 1..mouth-1
	qty = qty+m[i]
	end
qty = qty +day
	
if ((year % 100 ==0) && (year % 400 ==0))
	qty+=1
elsif (year % 4 ==0)
	qty+=1
end

print qty
