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