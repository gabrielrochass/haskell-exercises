-- 3) recebe uma lista de strings e retorna a quantidade de strings que estão ordenadas alfabeticamente

import Data.List

countSorted :: [String] -> Int
countSorted xs = length (filter (\x -> x == sort x) xs)

main :: IO ()
main = do
    let x = countSorted ["a", "b", "c", "d", "e"]
    print(x) -- 5

    let y = countSorted ["a", "b", "ca"]
    print(y) -- 2

    let z = countSorted ["a", "b", "ca", "d", "e"]
    print(z) -- 4

    print(countSorted ["aa", "bb", "cc", "da", "de"]) -- 4
    print(countSorted ["aa", "bb", "cb", "da", "de"]) -- 3
    print(countSorted ["aa", "bb", "cccc", "da", "de"]) -- 4
    print(countSorted ["aa", "bb", "cccc", "da", "ade"]) -- 4
    print(countSorted ["zw","aa", "bb", "cccc", "da", "ade"]) -- 4
    print(countSorted ["wz","aa", "bb", "cccc", "da", "ade"]) -- 5
