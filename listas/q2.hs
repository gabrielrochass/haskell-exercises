-- retorna lista de divisores de um inteiro positivo e uma lista vazia para outras entradas

divisores :: Integer -> [Integer]
divisores n = [x | x <- [1..n], n `mod` x == 0]
-- [1..n] gera uma lista de 1 a n
-- n `mod` x calcula o resto da divisão de n por x
-- n `mod` x == 0 verifica se o resto da divisão é zero
-- [x | x <- [1..n], n `mod` x == 0] filtra os valores de 1 a n que são divisores de n

main :: IO ()
main = do
    let x = divisores 12
    print(x) -- [1,2,3,4,6,12]
    
    let y = divisores 7
    print(y) -- [1,7]
    
    let z = divisores 0
    print(z) -- []
    
    let w = divisores (-5)
    print(w) -- []