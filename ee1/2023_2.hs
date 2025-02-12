-- Escreva uma fun¸c˜ao f :: [Int] −> [Int] que retorna uma lista contendo todos os elementos da
-- lista dada como argumento que ocorrem duas vezes em sucess˜ao. Caso o elemento ocorra n
-- vezes em sucess˜ao (n ≥ 2), o elemento surgir´a n − 1 vezes em sucess˜ao na lista dada como
-- resultado. N˜ao ´e necess´ario definir o valor para lista vazia.
-- Exemplos: f [1,2,2,3] = [2] f [1,2,2,2,2,1] = [2,2,2] f [3,2] = []
-- (1,0) Apresente uma solu¸c˜ao que pode utilizar fun¸c˜oes b´asicas e recurs˜ao, mas sem compreens˜ao (a)
-- de lista
-- (1,0) Apresente uma solu¸c˜ao com compreens˜ao de lista, mas que n˜ao tenha recurs˜ao

-- a)
f :: [Int] -> [Int]
f [] = []
f [x] = []
f (x:y:xs) = if x == y then x : f (y:xs) else f (y:xs)

-- b)
f' :: [Int] -> [Int]
f' xs = [x | (x, y) <- zip xs (tail xs), x == y]

-- Defina a fun¸c˜ao testaElementos :: (a −> Bool) −> [a] −> Bool que retorna True caso os
-- elementos da lista dada como argumento satisfa¸cam a fun¸c˜ao passada como primeiro argumento;
-- caso contr´ario, retorna False. Desenvolva solu¸c˜oes como se pede.
-- Exemplos :
-- ∗Main> te s t aElemen t o sA (>5) [ 1 . . 2 0 ]
-- False
-- ∗Main> te s t aElemen t o sA (>5) [ 6 . . 2 0 ]
-- True
-- (0.5) Usando recurs˜ao. (a)
-- (0.5) Usando as fun¸c˜oes (b) map e and.
-- (0.5) Usando (c) foldr. (Obs: uma fun¸c˜ao anˆonima pode ser ´util )


-- a)
testaElementos :: (a -> Bool) -> [a] -> Bool
testaElementos _ [] = True
testaElementos f (x:xs) = f x && testaElementos f xs

-- b)
testaElementos' :: (a -> Bool) -> [a] -> Bool
testaElementos' f xs = and (map f xs)

-- c)
testaElementos'' :: (a -> Bool) -> [a] -> Bool
testaElementos'' f xs = foldr (\x acc -> f x && acc) True xs


-- 3) Defina uma fun¸c˜ao 3. sublistas :: [a] −> [[a]] que retorna todas as sublistas de uma lista dada
-- como argumento.
-- Exemplos :
-- ∗Main> s u b l i s t a s [ 1 , 2 , 3 ]
-- [ [ 1 , 2 , 3 ] , [ 1 , 2 ] , [ 1 , 3 ] , [ 1 ] , [ 2 , 3 ] , [ 2 ] , [ 3 ] , [ ] ]
-- ∗Main> s u b l i s t a s [ ]
-- [ [ ] ]
-- ∗Main> s u b l i s t a s [ 1 ]
-- [ [ 1 ] , [ ] ]

-- 3)
sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (x:xs) = [x:ys | ys <- sublistas xs] ++ sublistas xs


-- 4. Considere uma fun¸c˜ao polinomial de grau 2 (f(x) = ax2+bx+c), onde a, b e c s˜ao os coeficientes
-- do polinˆomio.
-- (1,0) Defina a fun¸c˜ao (a) poli :: Integer −> Integer −> Integer −> Integer −> Integer que
-- recebe como argumentos os coeficientes de uma fun¸c˜ao polinomial de grau 2 e devolve uma
-- fun¸c˜ao de inteiro para inteiro (um polinˆomio)
-- P´agina 1 de 2
-- IF686 1EE - 2023.2 - Continua¸c˜ao Turma: I5
-- (1,0) Defina a fun¸c˜ao (b) listaPoli :: [( Integer,Integer,Integer)] −> [Integer−>Integer] que
-- aguarda uma lista de triplas de inteiros (coeficientes de um polinˆomio de segundo grau) e
-- devolve uma lista de fun¸c˜oes de inteiro para inteiro (polinˆomios) .
-- (1,0) Defina a fun¸c˜ao (c) appListaPoli :: [Integer−>Integer] −> [Integer] −> [Integer] que
-- recebe uma lista de fun¸c˜oes de polinˆomios e uma lista de inteiros. Esta fun¸c˜ao devolve
-- uma lista de inteiros que resultam da aplica¸c˜ao de cada polinˆomio da primeira lista aplicada
-- ao inteiro correspondente na segunda lista.
-- Exemplos :
-- ∗Main> a p p Li s t aP oli ( l i s t a P o l i [ ( 2 , 3 , 4 ) , ( 5 , 7 , 8 ) ] ) [ 3 , 7 ]
-- [ 3 1 , 3 0 2 ]
-- ∗Main> a p p Li s t aP oli ( l i s t a P o l i [ ( 2 , 3 , 4 ) , ( 5 , 7 , 8 ) ] ) [ 2 1 , 3 4]
-- [ 9 4 9 , 6 0 2 6 ]
-- ∗Main> a p p Li s t aP oli ( l i s t a P o l i [ ( 6 , 9 , 2 ) , ( 5 , 7 , 8 ) ] ) [ 2 1 , 3 4]
-- [ 2 8 3 7 , 6 0 2 6]



-- a)
poli :: Integer -> Integer -> Integer -> Integer -> (Integer -> Integer)
poli a b c x = (\x -> a*x^2 + b*x + c)

-- b)
listaPoli :: [(Integer, Integer, Integer)] -> [Integer -> Integer]
listaPoli xs = [poli a b c | (a, b, c) <- xs]

-- c)
appListaPoli :: [Integer -> Integer] -> [Integer] -> [Integer]
appListaPoli fs xs = [f x | f <- fs, x <- xs]


-- 5. Fa¸ca o que se pede:
-- (0,5) Defina um tipo alg´ebrico polim´orfico (a) Pilha que pode ser exibido.
-- (1,5) Defina as fun¸c˜oes: push, pop e top. (b)
-- Dicaa: (1) os valores da pilha podem ser modelados por uma lista padr˜ao da biblioteca e (2)
-- situa¸c˜oes de erro com a pilha vazia podem utilizar exce¸c˜oes em Haskell.


-- a)
data Pilha a = Pilha [a] deriving Show

-- b)
push :: a -> Pilha a -> Pilha a
push x (Pilha xs) = Pilha (x:xs)

pop :: Pilha a -> Pilha a
pop (Pilha []) = error "Pilha vazia"
pop (Pilha (_:xs)) = Pilha xs

top :: Pilha a -> a
top (Pilha []) = error "Pilha vazia"
top (Pilha (x:_)) = x

