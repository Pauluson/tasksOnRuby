letters = *('a'..'z')
volwes = ["a","e","o","i","u"]
res={}
letters.each do |letter|
	if volwes.include?(letter)
		res[letter]=letters.index(letter)+1
		end
		end
		print res

