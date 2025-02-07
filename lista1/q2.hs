import Data.Char
import Data.List


--conta as repetições de um elemento da lista fornecida
countRep :: Int -> [Int] -> Int
countRep y m = length [b | b <- m, b == y]


--seleciona apenas os elementos que aparecem uma vez na lista
unique :: [Int] -> [Int]
unique l = [a | a <- l, countRep a l == 1]
