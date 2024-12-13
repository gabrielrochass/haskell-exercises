# Funções de alta ordem: Map, Filter e Fold
- Funções de alta ordem: recebem outras funções como argumentos ou as produzem como resultado
    - aumentam reuso e modularidade
    - serve pra aplicar uma função a cada elemento a lista, retornando uma nova lista com os resultados

## Map
- **MAPEAMENTO**: transforma elementos de uma lista
- argumentos: transformação (função) e a lista de entrada
- map :: (a -> b) -> [a] -> [b]
    - (a -> b): função de entrada que transforma elemento do tipo a em elementos do tipo b
    - [a]: lista de entrada contendo elementos do tipo a
    - [b]: lista de saída contendo elementos do tipo b


> A função map percorre cada elemento da lista, aplica a função forneceida e acumula os resultados

```haskell
dobrar :: Int -> Int
dobrar x = x * 2

main = print (map dobrar [1, 2, 3, 4]) -- Resultado: [2, 4, 6, 8]
```
    
## Filter
- **FILTRO**: permite a seleção de elementos de uma lista
- serve para filtrar elementos de uma lista com base em uma condição (predicado)
- retorna uma nova lista contendo apenas os elementos que satisfazem o predicado
- filter :: (a -> Bool) -> [a] -> [a]
    - (a -> Bool): função de entrada que recebe um elemento do tipo a e retorna True ou False 
    - [a]: lista de entrada contendo elementos do tipo a
    - [a]: lista de saída contendo apenas os elementos que satisfazem o predicado (os que retornaram True)


> A função filter percorre cada elemento da lista e aplica o predicado a ele. Se o resultado for True, o elemento é incluído na lista de saída, caso contrário, ele é descartado.

```haskell
maiorQue5 :: Int -> Bool
maiorQue5 x = x > 5

main = IO()
main = print (filter maiorQue5 [1, 2, 3, 6, 7, 8])
-- Resultado: [6, 7, 8]
```

- *Observação:* 
    - filter não modifica a lista original, ele cria uma nova lista com os elementos filtrados
    - se o predicado sempre retornar true, a nova lista será igual a original
    - se nenhum elemento satifizer o predicado, o resultado será uma lista vazia

## Fold
- **FOLDING**: combina elementos de uma lista
- serve pra agregar os elementos de uma lista em um único valor
- haskell ofere duas variantes de fold:
    1. foldl (fold left): processa a lista da esquerda pra direita
    2. foldr (fold right): processa da direita -> esquerda
- foldl :: (b -> a -> b) -> b -> [a] -> b
    - (b -> a -> b): 
        - b: acumulador do tipo b
        - a: elemento da lista do tipo a
        - b: novo acumulador do tipo b
    - b: valor inicial do acumulador
    - [a]: lista de entrada (a ser processada)
    - b: resultado final, obtido após o processamento de toda a lista

```haskell
foldr (+) 0 [1, 2, 3, 4] -- 10

foldl (++) "" ["a", "b", "c", "d"]
-- (((("" ++ "a") ++ "b") ++ "c") ++ "d")
-- Passos:
-- 1. "" ++ "a" = "a"
-- 2. "a" ++ "b" = "ab"
-- 3. "ab" ++ "c" = "abc"
-- 4. "abc" ++ "d" = "abcd"

foldr (++) "" ["a", "b", "c", "d"]
-- ("a" ++ ("b" ++ ("c" ++ ("d" ++ ""))))
-- Passos:
-- 1. "d" ++ "" = "d"
-- 2. "c" ++ "d" = "cd"
-- 3. "b" ++ "cd" = "bcd"
-- 4. "a" ++ "bcd" = "abcd"
```

> O fold aplica uma função repetidamente aos elementos da lista. Ele pega um acumulador inicial, um elemento por vez e combina tudo em um resultado final.
