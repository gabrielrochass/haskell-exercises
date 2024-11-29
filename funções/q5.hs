maxFour1 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour1 a b c d = max (max a b) (max c d)
-- max só aceita dois argumentos, então é necessário chamar a função duas vezes

maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c = max (max a b) c

maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour2 a b c d = max (maxThree a b c) d
-- maxThree retorna o maior entre a, b e c, então é só comparar com d

main :: IO ()
main = do
    let x = maxFour1 1 2 3 4
    print(x) -- 4

    let y = maxFour2 1 2 3 4
    print(y) -- 4