-- a
import Data.Char -- toUpper
uppers :: String -> String
uppers = map toUpper 

-- b
doubles :: [Int] -> [Int]
doubles = map (*2) -- só pode pq é do mesmo tipo

-- c
centavosReais :: [Int] -> [Float]
centavosReais = map (\x -> fromIntegral x / 100) -- fromIntegral converte Int para Float
-- \x representa cada elemento da lista, ou seja, x é um elemento da lista


main :: IO ()
main = do

    let x = uppers "abc"
    print(x) -- "ABC"
    
    let y = uppers "abc def"
    print(y) -- "ABC DEF"
    
    let z = uppers ""
    print(z) -- ""

    let a = doubles [1, 2, 3, 4, 5]
    print(a) -- [2, 4, 6, 8, 10]

    let b = centavosReais [100, 200, 300]
    print(b) -- [1.0, 2.0, 3.0]