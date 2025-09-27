function caesar_encrypt(text::String)
    result = ""
    for char in text
        if 'а' <= char <= 'я'  
            new_char = Char(Int('а') + (Int('я')-Int(char)))
            result *= new_char
        else
            result *= char  
        end
    end
    return result
end

# Ввод данных пользователем
println("Введите текст для шифрования:")
plaintext = readline()

# Шифруем текст
ciphertext = caesar_encrypt(plaintext, key)
println("Зашифрованный текст: ", ciphertext)
