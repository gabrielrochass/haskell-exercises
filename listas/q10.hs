unique :: Eq a => [a] -> [a] --exige que os tipos sejam comparáveis
unique [] = []
unique [x] = [x]
unique (x:xs)
    | x `elem` xs = unique xs -- if x is in xs, remove x from the list
    | otherwise = x : unique xs -- if x is not in xs, keep x in the list

main :: IO ()
main = do
    
        let x = unique [1, 2, 3, 4, 5]
        print(x) -- [1,2,3,4,5]
        
        let y = unique [4, 3, 2, 1]
        print(y) -- [4,3,2,1]
        
        let z = unique [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
        print(z) -- [1,2,3,4,5]