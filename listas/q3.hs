-- se eu preciso de um comentário pra dizer oq a função faz, então o nome da função é ruim

menorLista :: [Int] -> Int
menorLista [] = error "Lista vazia"
menorLista [x] = x
menorLista (x:xs) =
    if x < menorLista xs
        then x
        else menorLista xs

main :: IO ()
main = do
    let x = menorLista [1, 2, 3, 4, 5]
    print(x) -- 1
    
    let y = menorLista [5, 4, 3, 2, 1]
    print(y) -- 1
    
    let z = menorLista [60, 20, 30, 40, 50]
    print(z) -- 20