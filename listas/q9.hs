produto :: [Int] -> Int
produto [] = 1
produto (x:xs) = x * produto xs

main :: IO ()
main = do

    let x = produto [1, 2, 3, 4, 5]
    print(x) -- 120
    
    let y = produto [4, 3, 2, 1]
    print(y) -- 24
    
    let z = produto []
    print(z) -- 1