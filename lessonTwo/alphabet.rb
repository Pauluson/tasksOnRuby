# frozen_string_literal: true

# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
letters = *('a'..'z')
volwes = %w[a e o i u]
res = {}
letters.each_with_index do |letter, index|
  res[letter] = index + 1 if volwes.include?(letter)
end
print res
