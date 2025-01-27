-- definir length usando map e sum

length' :: [a] -> Int
length' xs = sum (map (\_ -> 1) xs) -- map (\_ -> 1) xs = [1, 1, 1, 1, 1], ou seja, ignora todos os elementos da lista e substitui por 1, depois soma todos os elementos da lista

main :: IO ()
main = do

    let x = length' [1, 2, 3, 4, 5]
    print(x) -- 5
    
    let y = length' [4, 3, 2, 1]
    print(y) -- 4
    
    let z = length' []
    print(z) -- 0