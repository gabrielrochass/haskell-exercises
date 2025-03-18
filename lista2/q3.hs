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


