potencia :: Integer -> Integer -> Integer
-- usando recursão
potencia x 0 = 1
potencia x y = x * potencia x (y - 1)

main :: IO ()
main = do
    let x = potencia 2 3
    print(x) -- 8
    -- 2 * potencia 2 2 = 2 * 4 = 8

    let y = potencia 3 3
    print(y) -- 27
    -- 3 * potencia 3 2 = 3 * 9 = 27

    let z = potencia 10 2
    print(z) -- 100