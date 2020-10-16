array=[]

a=0
b=1
i = 1
until i==100
	a=a+b
	b=a-b
	i= i+1
	array = array +[a]
end
print array

