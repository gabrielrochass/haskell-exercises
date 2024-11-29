-- recursão é uma técnica que permite que uma função chame a si mesma.
sumTo :: Integer -> Integer
sumTo 0 = 0
sumTo n = n + sumTo (n - 1)

main :: IO ()
main = do
    let x = sumTo 3
    print(x) -- 6

    let y = sumTo 5
    print(y) -- 15

    let z = sumTo 10
    print(z) -- 55