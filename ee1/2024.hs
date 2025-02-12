-- 1

-- a) tipo de Projeto
type Projeto = (String, [String])

-- b) função criaProjeto que insere um projeto na lista de projetos
-- se o projeto a ser inserido já existir na coleção, ela n é alterada
-- criaProjeto recebe o id de um projeto, uma pessoa integrante do projeto e a coleção atual de projetos
criaProjeto :: String -> String -> [Projeto] -> [Projeto]
criaProjeto id pessoa [] = [(id, [pessoa])]
criaProjeto id pessoa ((proj, pessoas):ps) = 
    if proj == id then (proj, pessoas):ps
    else (proj, pessoas) : criaProjeto id pessoa ps

-- c) função equipe  que, quando aplicada a um identifcador de um projeto e a uma
-- coleção de projetos, tem como retorno a equipe associada ao projeto. Caso o identificador (do
-- projeto) dado como argumento não faça parte dos projetos da empresa, a função deve devolver
-- uma coleção vazia. 
equipe :: String -> [Projeto] -> [String]
equipe _ [] = []
equipe id ((proj, pessoas):ps) = 
    if proj == id then pessoas
    else equipe id ps

-- d) função naEquipe verifica se um projeto z e uma pessoa y estão relacionados.
-- Caso o projeto z tenha a pessoa y na equipe, a função resulta em True. Do contr¯rio, resulta
-- em False
naEquipe :: String -> String -> [Projeto] -> Bool
naEquipe _ _ [] = False
naEquipe proj pessoa ((proj, pessoas):ps) = 
    if proj == proj then elem pessoa pessoas
    else naEquipe proj pessoa ps

-- e) função acrescentaPessoa que insere na equipe de um projeto uma nova pessoa. Caso o projeto exista na lista de projetos, a pessoa é acrescentada à equipe, Caso o projeto não exista, a lista de projetos resultantes será a mesma que foi dada como argumento. 
acrescentaPessoa :: String -> String -> [Projeto] -> [Projeto]
acrescentaPessoa _ _ [] = []
acrescentaPessoa proj pessoa ((proj, pessoas):ps) = 
    if proj == proj then (proj, pessoa:pessoas):ps
    else (proj, pessoas) : acrescentaPessoa proj pessoa ps

-- 2)
data Nat = Zero | Succ Nat deriving (Eq, Show)

-- a) função int2Nat que converte um inteiro em um número natural
int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = 
    if n > 0 then Succ (int2Nat (n-1))
    else error "Número negativo"


-- b) função nat2Int que converte um número natural em um inteiro
nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + nat2Int n

-- c) função soma que soma dois números naturais
soma :: Nat -> Nat -> Nat
soma Zero n = n
soma (Succ n) m = Succ (soma n m)

-- d) função somaInt que soma dois números naturais e retorna um inteiro
somaInt :: Nat -> Nat -> Int
somaInt n m = nat2Int (soma n m)

