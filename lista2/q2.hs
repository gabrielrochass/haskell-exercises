--2) Recebendo uma lista de valores, se for Right x, x irá para a lista da direita, se for Left y, y irá para a lista da esquerda.

classifica :: [Either a b] -> ([a], [b])
classifica [] =([], [])
classifica (Left x : xs) = (x:ls, rs)
    where (ls,rs) = classifica xs
classifica (Right y : ys) = (ls, y: rs)
    where (ls,rs) = classifica ys


main :: IO ()
main =  do
    let c = classifica [Left 6, Left 5, Right True, Left 3]
    print c