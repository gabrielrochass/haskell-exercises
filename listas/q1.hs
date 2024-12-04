-- transforma string minuscula em maiuscula
import Data.Char (toUpper)

paraMaiuscula :: String -> String
paraMaiuscula [] = [] -- caso base: se a string for vazia, retorna vazio
paraMaiuscula (x:xs) = toUpper x : paraMaiuscula xs 

-- converte o primeiro caractere para maiúscula e chama a função recursivamente para o restante da string

-- x:xs é uma notação que significa que x é o primeiro elemento da lista e xs é o restante da lista
-- toUpper é uma função que converte um caractere para maiúscula
-- : é o operador de cons, que adiciona um elemento a uma lista
-- a função é recursiva, pois chama a si mesma para processar o restante da string

main :: IO ()
main = do
    let x = paraMaiuscula "abc"
    print(x) -- "ABC"
    
    let y = paraMaiuscula "abc def"
    print(y) -- "ABC DEF"
    
    let z = paraMaiuscula ""
    print(z) -- ""