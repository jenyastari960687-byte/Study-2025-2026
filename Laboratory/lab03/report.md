---
# Preamble

## Author
author:
  name: Старикова Евгения Дмитриевна
  degrees: BSc
  orcid: 0009-0005-2255-4025
  email: 1032259343@pfur.ru
  affiliation:
    - name: Российский университет дружбы народов
      country: Российская Федерация
      city: Москва
      address: ул. Миклухо-Маклая, д. 6
## Title
title: "Лабораторная работа №3"
subtitle: "Шифрование гаммированием"
license: "CC BY"
## Generic options
lang: ru-RU
number-sections: true
toc: true
toc-title: "Содержание"
toc-depth: 2
## Crossref customization
crossref:
  lof-title: "Список иллюстраций"
  lot-title: "Список таблиц"
  lol-title: "Листинги"
## Bibliography
bibliography:
  - bib/cite.bib
csl: _resources/csl/gost-r-7-0-5-2008-numeric.csl
## Formats
format:
### Pdf output format
  pdf:
    toc: true
    number-sections: true
    colorlinks: false
    toc-depth: 2
    lof: true # List of figures
    lot: false # List of tables
#### Document
    documentclass: scrreprt
    papersize: a4
    fontsize: 12pt
    linestretch: 1.5
#### Language
    babel-lang: russian
    babel-otherlangs: english
#### Biblatex
    cite-method: biblatex
    biblio-style: gost-numeric
    biblatexoptions:
      - backend=biber
      - langhook=extras
      - autolang=other*
#### Misc options
    csquotes: true
    indent: true
    header-includes: |
      \usepackage{indentfirst}
      \usepackage{float}
      \floatplacement{figure}{H}
      \usepackage[RM={Scale=0.94},SS={Scale=0.94},SScon={Scale=0.94},TT={Scale=MatchLowercase,FakeStretch=0.9},DefaultFeatures={Ligatures=Common}]{plex-otf}
### Docx output format
  docx:
    toc: true
    number-sections: true
    toc-depth: 2
---

# Цель работы

Цель работы -- изучить и реализовать шифры перестшифрование гаммированием.

# Задание

С помощью языка программирования Julia реализовать:

- шифрование гаммированием.

# Теоретическое введение

Julia — высокоуровневый свободный язык программирования с динамической типизацией, созданный для математических вычислений[@julialang]. Эффективен также и для написания программ общего назначения. Синтаксис языка схож с синтаксисом других математических языков, однако имеет некоторые существенные отличия.

Для выполнения заданий была использована официальная документация Julia[@juliadoc].

# Выполнение лабораторной работы

Шифрование гаммированием — это симметричный метод шифрования, при котором к открытым данным (тексту) применяется операция наложения (обычно XOR) с последовательностью случайных чисел, называемой гаммой. Эта гамма должна быть не короче сообщения и обеспечивает обратимость операции, позволяя расшифровать данные при наличии той же гаммы. Такой метод обеспечивает высокую стойкость при условии использования случайной и одноразовой гаммы.


```julia
function gamma_cypher(text, gamma; mod=33)
    russian_alphabet = collect("абвгдежзийклмнопрстуфхцчшщьыъэюя")
    
    # Фильтруем текст, оставляя только буквы и приводим к нижнему регистру
    filtered_text = [c for c in lowercase(text) if c in russian_alphabet]
    
    # Преобразуем гамму в числовые значения
    gamma_nums = [findfirst(==(c), russian_alphabet) for c in gamma]
    
    # Создаем повторяющуюся гамму нужной длины
    repeated_gamma = repeat(gamma_nums, ceil(Int, length(filtered_text) / length(gamma_nums)))
    
    cyphered_text = ""
    
    for (a, b) in zip(filtered_text, repeated_gamma)
        # Находим индекс буквы в алфавите
        char_index = findfirst(==(a), russian_alphabet)
        # Вычисляем новый индекс
        new_index = (char_index + b) % mod
        if new_index == 0
            new_index = mod
        end
        # Добавляем соответствующую букву
        cyphered_text *= russian_alphabet[new_index]
    end
    
    return cyphered_text
end
```
Также реализуем простую программу для проверки работы шифра:

```julia
function main()
    text = "приказ"
    gamma = "гамма"
    cyphered_text = gamma_cypher(text, gamma)
    println("Исходный текст: ", text)
    println("Гамма: ", gamma)
    println("Зашифрованный текст: ", cyphered_text)
end
```



# Выводы

С помощью языка программирования Julia были реализованы:

- шифрование гаммированием.

# Список литературы{.unnumbered}

::: {#refs}
:::
