-- a
isLetter :: Char -> Bool
isLetter c = c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z'

letras :: String -> String
letras = filter isLetter

-- b
removeChar :: Char -> String -> String
removeChar c = filter (/= c) -- remove o caractere c da string
-- / é a divisão,  /= é diferente

-- c
acima :: Int -> [Int] -> [Int]
acima n = filter (> n)

-- d
desiguais :: [(Int, Int)] -> [(Int, Int)]
desiguais = filter (\(x, y) -> x /= y)


main :: IO ()
main = do

    let x = letras "abc"
    print(x) -- "abc"
    
    let y = letras "abc def"
    print(y) -- "abcdef"
    
    let z = letras ""
    print(z) -- ""

    let a = letras "abc123"
    print(a) -- "abc"

    let b = removeChar 'a' "abc"
    print(b) -- "bc"

    let c = acima 3 [1, 2, 3, 4, 5]
    print(c) -- [4, 5]

    let d = desiguais [(1, 2), (2, 2), (3, 3), (4, 5)]
    print(d) -- [(1, 2), (4, 5)]