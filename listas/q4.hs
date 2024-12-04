mesure :: [a] -> Int
mesure [] = 0
mesure (x:xs) = 1 + mesure xs

main :: IO ()
main = do

    let x = mesure [1, 2, 3, 4, 5]
    print(x) -- 5
    
    let y = mesure [4, 3, 2, 1]
    print(y) -- 4
    
    let z = mesure []
    print(z) -- 0