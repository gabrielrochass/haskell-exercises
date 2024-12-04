remove :: Int -> [a] -> [a]
remove _ [] = []
remove n (x:xs)
    | n == 0 = xs
    | otherwise = x : remove (n - 1) xs

main :: IO ()
main = do
    let x = remove 3 [1, 2, 3, 4, 5]
    print(x) -- [1,2,3,5]
    
    let y = remove 2 [5, 4, 3, 2, 1]
    print(y) -- [5,4,2,1]
    
    let z = remove 0 [60, 20, 30, 40, 50]
    print(z) -- [20,30,40,50]