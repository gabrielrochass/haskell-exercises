takeFinal :: Int -> [a] -> [a]
takeFinal n xs = drop (length xs - n) xs

takeFinal2 :: Int -> [a] -> [a]
takeFinal2 n xs = reverse (take n (reverse xs))

takeFinal3 :: Int -> [a] -> [a]
takeFinal3 n xs = take n (reverse xs)

main :: IO ()
main = do
    let x = takeFinal 3 [1, 2, 3, 4, 5]
    print(x) -- [3,4,5]

    let y = takeFinal 2 [5, 4, 3, 2, 1]
    print(y) -- [2,1]

    let z = takeFinal3 2 [60, 20, 30, 40, 50]
    print(z) -- [50,40]