# frozen_string_literal: true

array = [0]

a = 0
b = 1
i = 1
until i > 100
  a += b
  b = a - b
  i += 1
  array += [a]

end
print array
