function caesar_encrypt(text::String, key::Int)
    result = ""
    for char in text
        if 'а' <= char <= 'я'  # только для русских букв
            i = Int(char) - Int('а')          # буква → число 0–31
            new_i = (i + key) % 32            # циклический сдвиг
            result *= Char(new_i + Int('а'))  # число → буква
        else
            result *= char  # прочие символы без изменений
        end
    end
    return result
end

# Ввод данных пользователем
println("Введите текст для шифрования:")
plaintext = readline()
println("Введите ключ (целое число):")
key = parse(Int, readline())

# Шифруем текст
ciphertext = caesar_encrypt(plaintext, key)
println("Зашифрованный текст: ", ciphertext)
