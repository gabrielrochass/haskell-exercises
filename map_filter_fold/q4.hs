import Data.Char

-- [toUpper c | c <− s, isAlpha c ]
upper :: String -> String
upper s = map toUpper (filter isAlpha s) -- isAlpha é uma função nativa que verifica se o caractere é uma letra 

-- [2 ∗x | x <− xs, x > 3 ]
double3 :: [Int] -> [Int]
double3 a = map (*3) (filter (>3) a)

-- [reverse s | s <− strs, even (length s) ]
reverseEven :: [String] -> [String]
reverseEven a = map reverse (filter (\x -> even (length x)) a)

main :: IO ()
main = do

    let b = upper "abc def 123 ghi"
    print(b) -- "ABCDEFGHI"

    let c = double3 [1, 2, 3, 4, 5]
    print(c) -- [12, 15]

    let d = reverseEven ["abc", "def", "ghio", "jklm"]
    print(d) -- ["oihg", "mlkj"]