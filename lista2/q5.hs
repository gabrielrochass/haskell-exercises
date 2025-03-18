-- 5) Implemente uma instância de Num para Vetor de modo que as operações sejam feitas elemento a elemento.
-- exemplos:
--
-- Vetor 1 2 3 + Vetor 0 1 1 == Vetor 1 3 4
-- Vetor 1 2 3 * Vetor 0 1 2 == Vetor 0 2 6
-- abs (Vetor (-1) 2 (-3)) == Vetor 1 2 3
-- signum (Vetor (-1) 2 (-3)) == Vetor (-1) 1 (-1) -- se o elemento for 0, o resultado é 0, se for positivo, o resultado é 1, se for negativo, o resultado é -1

data Vetor = Vetor Integer Integer Integer 
    deriving (Show)

instance Eq Vetor where
    (Vetor x1 y1 z1) == (Vetor x2 y2 z2) = x1 == x2 && y1 == y2 && z1 == z2 -- se todos os elementos forem iguais, então os vetores são iguais.

instance Num Vetor where
    (Vetor x1 y1 z1) + (Vetor x2 y2 z2) = Vetor (x1 + x2) (y1 + y2) (z1 + z2)
    (Vetor x1 y1 z1) * (Vetor x2 y2 z2) = Vetor (x1 * x2) (y1 * y2) (z1 * z2)
    abs (Vetor x y z) = Vetor (abs x) (abs y) (abs z)
    signum (Vetor x y z) = Vetor (signum x) (signum y) (signum z)
    fromInteger n = Vetor n n n
    negate (Vetor x y z) = Vetor (negate x) (negate y) (negate z)

main :: IO ()
main = do
    -- Teste 1: Soma de vetores
    let v1 = Vetor 1 2 3
    let v2 = Vetor 0 1 1
    putStrLn $ "Teste 1 - Soma de vetores: " ++ show (v1 + v2) -- Vetor 1 3 4

    -- Teste 2: Multiplicação de vetores
    let v3 = Vetor 1 2 3
    let v4 = Vetor 0 1 2
    putStrLn $ "Teste 2 - Mult de vetores: " ++ show (v3 * v4) -- Vetor 0 2 6

    -- Teste 3: Valor absoluto de um vetor
    let v5 = Vetor (-1) 2 (-3)
    putStrLn $ "Teste 3 - Valor absoluto de um vetor: " ++ show (abs v5) -- Vetor 1 2 3

    -- Teste 4: Signum de um vetor
    let v6 = Vetor (-1) 2 (-3)
    putStrLn $ "Teste 4 - Signum de um vetor: " ++ show (signum v6) -- Vetor (-1) 1 (-1) -- se o elemento for 0, o resultado é 0, se for positivo, o resultado é 1, se for negativo, o resultado é -1