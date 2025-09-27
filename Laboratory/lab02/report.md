# Лабораторная работа №2

**Шифры перестановки**

Старикова Евгения Дмитриевна, НПМмд-02-25

**Цель работы:**

Целью данной работы является изучение шифрования перестановки, принцип его работы, реализация на Julia.

**Задание:**

1.  Реализовать маршрутное шифрование
2.  Реализовать шифрование с помощью решёток
3.  Реализовать шифр Виженера

**Ход работы:**

1.  Реализация:

function route_encrypt(message, key, rows, cols)

&nbsp;       message = filter(!isspace, message)

&nbsp;       matrix = fill('\_', rows, cols)

&nbsp;       index = 1

&nbsp;       new_message = ""

&nbsp;       for i = 1:rows

&nbsp;               for j = 1:cols

&nbsp;                       if index != rows \* cols

&nbsp;                               matrix\[i, j\] = message\[index\]

&nbsp;                               index += 1

&nbsp;                       end

&nbsp;               end

&nbsp;       end

&nbsp;       for j in sort(collect(key))

&nbsp;               for i = 1:rows

&nbsp;                       new_message \*= (matrix\[i, (findfirst(j, key))\])

&nbsp;               end

&nbsp;       end

&nbsp;       return new_message

end

message = "this is a text message!"

rows, cols = 4, 5

key = "water"

println(route_encrypt(message, key, rows, cols))

Выполнение: hamgses!ixs_iteetsta

1.  Реализация:

function rails_encrypt(text, key, k)

&nbsp;       grid = fill(" ", 2 \* k, 2 \* k)

&nbsp;       matrix = fill(" ", k, k)

&nbsp;       index = 1

&nbsp;       new_message = ""

&nbsp;       text = replace(text, " " => "")

&nbsp;       for i in 1:k

&nbsp;               for j in 1:k

&nbsp;                       grid\[i, j\] = string(index)

&nbsp;                       matrix\[i, j\] = string(index)

&nbsp;                       index += 1

&nbsp;               end

&nbsp;       end

&nbsp;       for i = 1:(size(grid)\[1\])

&nbsp;               for j = (size(grid)\[1\]):-1:1

&nbsp;                       if grid\[i, j\] == " "

&nbsp;                               matrix = rotr90(matrix)

&nbsp;                               grid\[(i+k-1):-1:i, j:-1:(j-k+1)\] = matrix\[k:-1:1, k:-1:1\]

&nbsp;                       end

&nbsp;               end

&nbsp;       end

&nbsp;       index = 1

&nbsp;       arr = Vector{String}()

&nbsp;       for r in text

&nbsp;               checker = false

&nbsp;               for i = 1:(size(grid)\[1\])

&nbsp;                       for j = 1:(size(grid)\[2\])

&nbsp;                               if grid\[i, j\] == string(index) && checker == false

&nbsp;                                       if ((string(i + 1, " ", j) ∉ arr) && (string(i - 1, " ", j) ∉ arr) && (string(i, " ", j - 1) ∉ arr) && (string(i, " ", j + 1) ∉ arr))

&nbsp;                                               grid\[i, j\] = string(r)

&nbsp;                                               push!(arr, string(i, " ", j))

&nbsp;                                               checker = true

&nbsp;                                       end

&nbsp;                               end

&nbsp;                       end

&nbsp;                       if checker == true

&nbsp;                               index += 1

&nbsp;                               if index > k^2

&nbsp;                                       index = 1

&nbsp;                                       empty!(arr)

&nbsp;                               end

&nbsp;                               break

&nbsp;                       end

&nbsp;               end

&nbsp;       end

&nbsp;       for j in sort(collect(key))

&nbsp;               for i = 1:2k

&nbsp;                       new_message \*= (grid\[i, (findfirst(j, key))\])

&nbsp;                       if tryparse(Float64, string(last(new_message))) != nothing

&nbsp;                               new_message = replace(new_message, last(new_message) => ' ')

&nbsp;                       end

&nbsp;               end

&nbsp;       end

&nbsp;       return new_message

end

text = "Hello, how are you?"

key = "keys"

k = 3

println(rails_encrypt(text, key, k))

Выполнение: ro Hyh ?o luw

1.  Реализация:

function vigenere_encrypt(text, key)

&nbsp;       alphabet = 'a':'z'

&nbsp;       output = ""

&nbsp;       key_index = 1

&nbsp;       for i in text

&nbsp;               if isletter(i)

&nbsp;                       offset = findfirst(isequal(key\[key_index\]), alphabet) - 1

&nbsp;                       index = findfirst(isequal(i), alphabet) + offset

&nbsp;                       index > 26 && (index -= 26)

&nbsp;                       output \*= alphabet\[index\]

&nbsp;                       key_index += 1

&nbsp;                       key_index > length(key) && (key_index = 1)

&nbsp;               else

&nbsp;                       output \*= i

&nbsp;               end

&nbsp;       end

&nbsp;       return output

end

text = "hello peace"

key = "key"

println(vigenere_encrypt(text, key))

Выполнение: rijvs noeao

**Вывод:**

В данной лабораторной работе были изучены три шифра перестановки, все три были реализованы на Julia и работают корректно.
