import Data.Char
import Data.List


--encontrando os fatores de n
fatores :: Int -> [Int]
fatores n = [a | a <- [1..n], n mod a == 0]


--colocar os elementos de uma lista ao quadrado e selecionar apenas os <= n
sqrLista :: [Int] -> Int -> [Int]
sqrLista x n = map (^2) . filter (\a -> a ^2 <= n) $ x


--somar os pares da lista de fatores
sumPairFatores :: [Int] -> [Int]
sumPairFatores [la] = []
sumPairFatores (la:lb:ls) = sum [la,lb] : sumPairFatores (lb:ls)


--concatenando a lista de fatores ao quadrado filtrados, com a lista das somas de fatores ao quadrado filtrados
p :: Int -> [Int]
p n = sort ((sqrLista (fatores n) n ) ++ (sqrLista (sumPairFatores (fatores n)) n))