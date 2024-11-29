quantosIguais :: Integer -> Integer -> Integer -> Integer
quantosIguais a b c
    | a == b && b == c = 3
    | a == b || b == c || a == c = 2
    | otherwise = 0

main :: IO ()
main = do
    let x = quantosIguais 1 2 3
    print(x) -- 0

    let y = quantosIguais 1 1 2
    print(y) -- 2

    let z = quantosIguais 1 1 1
    print(z) -- 3