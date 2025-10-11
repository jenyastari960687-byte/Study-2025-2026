function gamma_cypher(text, gamma; mod=33)
    russian_alphabet = collect("абвгдежзийклмнопрстуфхцчшщьыъэюя")
    filtered_text = [c for c in lowercase(text) if c in russian_alphabet]
    gamma_nums = [findfirst(==(c), russian_alphabet) for c in gamma]
    
   
    repeated_gamma = repeat(gamma_nums, ceil(Int, length(filtered_text) / length(gamma_nums)))
    
    cyphered_text = ""
    
    for (a, b) in zip(filtered_text, repeated_gamma)
        
        char_index = findfirst(==(a), russian_alphabet)
        
        new_index = (char_index + b) % mod
        if new_index == 0
            new_index = mod
        end
       
        cyphered_text *= russian_alphabet[new_index]
    end
    
    return cyphered_text
end

# Основная программа
function main()
    text = "приказ"
    gamma = "гамма"
    cyphered_text = gamma_cypher(text, gamma)
    println("Исходный текст: ", text)
    println("Гамма: ", gamma)
    println("Зашифрованный текст: ", cyphered_text)
end

# Запуск программы
main()