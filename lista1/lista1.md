
## Questão 1
(0,2 points) Considere um número positivo caracterizado como sendo igual à soma do quadrado dos seus fatores. Defina a função `p :: Integer -> [Integer]` que, ao receber um argumento `n`, retorna a lista dos números que são iguais à soma dos quadrados dos seus fatores menores ou iguais a `n`. Para isso, defina e use a função `fatores`, que retorna a lista de fatores de seu argumento. Na sua solução, utilize composição de funções.

Exemplo:

```haskell
p 4 ==> [4, 1]
p 50 ==> [4, 9, 25, 9, 4, 1]
```

```haskell
import Data.Char
import Data.List

-- encontrando os fatores de n
fatores :: Int -> [Int]
fatores n = [a | a <- [1..n], n `mod` a == 0]

-- colocar os elementos de uma lista ao quadrado e selecionar apenas os <= n
sqrLista :: [Int] -> Int -> [Int]
sqrLista x n = map (^2) . filter (\a -> a ^2 <= n) $ x

-- somar os pares da lista de fatores
sumPairFatores :: [Int] -> [Int]
sumPairFatores [la] = []
sumPairFatores (la:lb:ls) = sum [la,lb] : sumPairFatores (lb:ls)

-- concatenando a lista de fatores ao quadrado filtrados, com a lista das somas de fatores ao quadrado filtrados
p :: Int -> [Int]
p n = sort ((sqrLista (fatores n) n ) ++ (sqrLista (sumPairFatores (fatores n)) n))
```

## Questão 2
Defina a função `unique :: [Integer] -> [Integer]` que retorna os elementos que ocorrem apenas uma vez na lista dada como argumento.

Exemplo:

```haskell
unique [1, 2, 2, 3, 4, 5, 5, 6, 6, 7] ==> [1, 3, 4, 7]
```
```haskell
import Data.Char
import Data.List

-- conta as repetições de um elemento da lista fornecida
countRep :: Int -> [Int] -> Int
countRep y m = length [b | b <- m, b == y]

-- seleciona apenas os elementos que aparecem uma vez na lista
unique :: [Int] -> [Int]
unique l = [a | a <- l, countRep a l == 1]
```

## Questão 3
A função `countSorted` recebe uma lista de strings e retorna quantas delas estão em ordem alfabética. Use as funções `length`, `filter` e `sort`.
```haskell
import Data.Char
import Data.List

-- conta recebe uma lista de strings e retorna a quantidade de strings que estão ordenadas alfabeticamente
countSorted :: [String] -> Int
countSorted xs = length (filter (\x -> x == sort x) xs)
```

## Questão 4
Implemente a função `mStr` que:
- recebe uma lista de strings como entrada
- retorna uma string que:
    - contém todas as palavras de entrada com tamanho maior que 5
    - combinadas em uma única string, separadas por espaços
    - e convertidas em letras maiúsculas

Funções que podem auxiliar:

```haskell
toUpper :: Char -> Char -- módulo Data.Char
intercalate :: [a] -> [[a]] -> [a] -- módulo Data.List
```
```haskell
import Data.Char
import Data.List

mStr :: [String] -> String
mStr [] = ""
mStr (x:xs) = if length x > 5 then map toUpper x ++ mStr xs else mStr xs
```

## Questão 5
Compute as somas parciais de listas dadas. Por exemplo:
```haskell
sumsOf [a, b, c] ==> [a, a+b, a+b+c]  
sumsOf [a, b] ==> [a, a+b]  
sumsOf [] ==> []
```

Exemplo:

```haskell
sumsOf [1, 2, 3] ==> [1, 3, 6]  
sumsOf [1, 2, 3, 4] ==> [1, 3, 6, 10]
```


```haskell
import Data.Char
import Data.List

-- recebe uma lista de inteiros e retorna uma lista com a soma acumulada dos elementos da lista original
sumsOf :: [Int] -> [Int]
sumsOf [] = []
sumsOf l = arrayOfSums l 0

-- recebe uma lista de inteiros e um inteiro n e retorna uma lista com a soma acumulada dos elementos da lista original
arrayOfSums :: [Int] -> Int -> [Int]
arrayOfSums [] _ = []
arrayOfSums (x:xs) n = (x+n) : arrayOfSums xs (x+n)

```
