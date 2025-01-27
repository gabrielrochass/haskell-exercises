-- a
productRec :: [Int] -> Int
productRec [] = 1
productRec (x:xs) = foldr (*) x xs

-- b
andRed :: [Bool] -> Bool
andRed [] = True
-- andRed xs = foldr (&&) True xs
andRed (x:xs) = foldr (&&) x xs

-- c
concatRec :: [String] -> String
concatRec [] = ""
concatRec (x:xs) = foldr (++) x xs

main :: IO ()
main = do
    let x = productRec [1, 2, 3, 4, 5]
    print(x) -- 120

    let y = andRed [True, True, True]
    print(y) -- True

    let z = concatRec ["abc", "def", "ghi"]
    print(z) -- "abcdefghi"
