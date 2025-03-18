--1) Dado uma função para classificar lista de a, se for Just a, a entra na lista final,
--   se for nothing, a não entra.

testFunc :: Int -> Maybe Int
testFunc x 
  | x >= 2    = Just x
  | otherwise = Nothing       

mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe _ [] = []
mapMaybe g (x:xs) = 
  case g x of
    Just y  -> y : mapMaybe g xs
    Nothing -> mapMaybe g xs


--2) Recebendo uma lista de valores, se for Right x, x irá para a lista da direita, 
--   se for Left y, y irá para a lista da esquerda.

classifica :: [Either a b] -> ([a], [b])
classifica [] =([], [])
classifica (Left x : xs) = (x:ls, rs)
    where (ls,rs) = classifica xs
classifica (Right y : ys) = (ls, y: rs)
    where (ls,rs) = classifica ys


main :: IO ()
main =  do
let m = mapMaybe testFunc [2,3,1,0,-1,-232]
print(m)
let c = classifica [Left 6, Left 5, Right True, Left 3]
print(c)

-- 3) Descobrir como duas listas diferem entre si. 
-- se tiver comprimento diferente -> retorna Just "<comprimento da lista 1> /= <comprimento da lista 2>"

-- se tiverem o mesmo comprimento -> encontrar o primeiro índice onde os elementos são diferentes e retornar Just "<índice da lista 1> /= <índice da lista 2>"

-- se as listas forem iguais -> retornar Nothing

-- escreva a assinatura de tipo para findDifference -> findDifference :: [a] -> [a] -> Maybe String

-- Classes de tipos nescessárias: Eq, Show, ou seja, a lista deve conter elementos que possam ser comparados e mostrados.

-- Exemplos de uso:
-- findDifference [1,2,3] [1,2,3] == Nothing
-- findDifference [1,2,3] [1,2,4] == Just "2 /= 2"
-- findDifference [1,2,3] [1,2,3,4] == Just "3 /= 4"
-- findDifference [1,2,3] [1,2] == Just "3 /= 2"

findDifference :: (Eq a, Show a) => [a] -> [a] -> Maybe String
findDifference [] [] = Nothing
findDifference xs ys
    | length xs /= length ys = Just (show (length xs) ++ " /= " ++ show (length ys))
    | otherwise = findDifference' xs ys 0
    where
        findDifference' [] [] _ = Nothing
        findDifference' (x:xs) (y:ys) i
            | x /= y = Just (show i ++ " /= " ++ show i)
            | otherwise = findDifference' xs ys (i+1)
    
main :: IO ()
main = do
    print $ findDifference [1,2,3] [1,2,3] -- Nothing
    print $ findDifference [1,2,3] [1,2,4] -- Just "2 /= 2"
    print $ findDifference [1,2,3] [1,2,3,4] -- Just "3 /= 4"
    print $ findDifference [1,2,3] [1,2] -- Just "3 /= 2"


-- 4) Este é um tipo para um vetor 3D. implemente uma instância de Eq para ele.

data Vetor = Vetor Integer Integer Integer 
    deriving (Show)

instance Eq Vetor where
    (Vetor x1 y1 z1) == (Vetor x2 y2 z2) = x1 == x2 && y1 == y2 && z1 == z2 -- se todos os elementos forem iguais, então os vetores são iguais.

main :: IO ()
main = do
    -- Teste 1: Vetores iguais
    let v1 = Vetor 1 2 3
    let v2 = Vetor 1 2 3
    putStrLn $ "Teste 1 - Vetores iguais: " ++ show (v1 == v2) -- True

    -- Teste 2: Vetores diferentes
    let v3 = Vetor 1 2 3
    let v4 = Vetor 4 5 6
    putStrLn $ "Teste 2 - Vetores diferentes: " ++ show (v3 == v4) -- False

    -- Teste 3: Vetores com um elemento diferente
    let v5 = Vetor 1 2 3
    let v6 = Vetor 1 2 4
    putStrLn $ "Teste 3 - Vetores com um elemento diferente: " ++ show (v5 == v6) -- False