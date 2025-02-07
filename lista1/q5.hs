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