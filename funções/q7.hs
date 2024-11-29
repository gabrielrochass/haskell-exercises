-- casamento de padrão, ou pattern matching, é uma técnica que permite definir funções de forma mais concisa e legível. 
-- É usado para definir funções que se comportam de maneira diferente dependendo dos argumentos passados.

ehZero :: Integer -> Bool
ehZero 0 = True
ehZero _ = False -- _ é um wildcard, que casa com qualquer valor

main :: IO ()
main = do
    let x = ehZero 0
    print(x) -- True

    let y = ehZero 1
    print(y) -- False

    let z = ehZero 2
    print(z) -- False