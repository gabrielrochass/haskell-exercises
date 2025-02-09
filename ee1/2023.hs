import Main (zeroVendas2)

-- equipamento = string
-- uso = (equipamento, Int) -> (equipamento usado, horas de uso)
-- listaUsos = [uso] -> lista de usos no dia

-- type: não cria novo tipo, apenas renomeia tipos existentes pra facilitar compreensão do código
type Equipamento = String -- equipamento é sinônimo de string
type Uso = (Equipamento, Int) -- (string, int)
type ListaUso = [Uso] -- [(string, int)]

type Preco = Int
type Tarifa = (Equipamento, Preco)
type Tarifas = [Tarifa]

-- 1) 

-- a) verificar se todos os tempos de uso que ocorrem na listaUso são inteiros positivos
inv :: ListaUso -> Bool
inv [] = True
inv ((_, x):xs) = x > 0 && inv xs 
-- inv ((_, x):xs) = if x > 0 then inv xs else False
-- (_, x) -> ignora o primeiro elemento da tupla e pega o segundo

-- b) calcula o tempo acumulado de um equipamento em listaUso
duracaoDe :: Equipamento -> ListaUso -> Int
duracaoDe _ [] = 0
duracaoDe equipamento (x:xs) 
    | fst x == equipamento = snd x + duracaoDe equipamento xs
    | otherwise = duracaoDe equipamento xs
-- fst x -> pega o primeiro elemento da tupla
-- snd x -> pega o segundo elemento da tupla
-- duracaoDe eqp (x:xs) = if fst x == eqp then snd x + duracaoDe eqp xs else duracaoDe eqp xs

-- c) verifica se a listaUso é bem formada, ou seja, se satifaz inv e se a soma dos tempos de uso de cada equipamento é menor que 24
usaMenosQue24 :: ListaUso -> Bool
usaMenosQue24 [] = True
usaMenosQue24 (x:xs) = duracaoDe (fst x) (x:xs) <= 24 && usaMenosQue24 xs 

bemFormada :: ListaUso -> Bool 
bemFormada [] = True
bemFormada l = inv l && usaMenosQue24 l


-- d) remove todos os usos de um equipamento em listaUso
removerEqp :: Equipamento -> ListaUso -> ListaUso
removerEqp _ [] = []
removerEqp eqp (x:xs) = filter (\(e, _) -> e /= eqp) (x:xs)

-- e) verifica se há uma tarifa definida para cada equipamento em listaTarifa
definidoEm :: ListaUso -> Tarifas -> Bool
definidoEm [] _ = True
definidoEm _ [] = True
definidoEm ((eqp, _):xs) tarifas = elem eqp (map fst tarifas) && definidoEm xs tarifas 
-- elem = in em python
-- map fst tarifas -> pega o primeiro elemento de cada tupla em tarifas e retorna uma lista com esses elementos
-- elem eqp (map fst tarifas) -> verifica se eqp está em map fst tarifas

-- f) calcula o preço total de uma listaUso de acordo com uma listaTarifa
precoDe :: ListaUso -> Tarifas -> Preco
precoDe [] _ = 0
precoDe ((eqp, uso):xs) tarifas = 
    case filter (\(e, _) -> e == eqp) tarifas of
    [] -> error ("Tarifa nao definida para o equipamento: " ++ eqp)
    ((_, preco):_) -> preco * uso + precoDe xs tarifas
-- head -> pega o primeiro elemento de uma lista
-- filter (\(e, _) -> e == eqp) tarifas -> filtra a lista tarifas e retorna uma lista com as tuplas que tem o equipamento eqp
-- snd (head (filter (\(e, _) -> e == eqp) tarifas)) -> pega o segundo elemento da tupla que tem o equipamento eqp
-- snd (head (filter (\(e, _) -> e == eqp) tarifas)) * uso -> multiplica o preço do equipamento pelo uso
-- precoDe xs tarifas -> chama a função recursivamente para calcular o preço dos próximos equipamentos


-- 2) 
-- retorna o numero de semanas em que a qnt de items vendidos foi zero
vendas 0 = 0
vendas 1 = 2
vendas 2 = 0
vendas 3 = 0
vendas 4 = 1
vendas 5 = 3
vendas 6 = 4

zeroVendas :: Int -> Int
zeroVendas n = length [() | i <- [0..n], vendas i == 0]

zeroVendass :: Int -> Int
zeroVendass n = length (filter (\i -> vendas i == 0) [0..n])



main :: IO ()
main = do
    let e1 = ("maquina de lavar", 2)
    let e2 = ("cafeteira", 1)
    let e3 = ("lava loucas", 2)
    let e4 = ("maquina de lavar", 3)
    let l = [e1, e2, e3, e4]

    print (inv l) -- True
    print (duracaoDe "cafeteira" l) -- 1
    print (duracaoDe "maquina de lavar" l) -- 5

    let e1' = ("maquina de lavar", -2)
    let e2' = ("cafeteira", 1)
    let l' = [e1', e2', e1', e2']

    print (inv l') -- False

    let e1'' = ("maquina de lavar", 23)
    let e2'' = ("cafeteira", 1)
    let e3'' = ("lava loucas", 2)
    let e4'' = ("maquina de lavar", 2)
    let l'' = [e1'', e2'', e3'', e4'']

    putStrLn ""
    print(duracaoDe "maquina de lavar" l'') -- 25
    print (bemFormada l'') -- False
    print (bemFormada l) -- True

    putStrLn ""
    print (removerEqp "cafeteira" l) -- [("maquina de lavar",2),("lava loucas",2),("maquina de lavar",3)]
    print (removerEqp "maquina de lavar" l) -- [("cafeteira",1),("lava loucas",2)]

    let tr1 = ("maquina de lavar", 20)
    let tr2 = ("cafeteira", 3)
    let tr3 = ("lava loucas", 15)
    let trf = [tr1, tr2, tr3]

    putStrLn ""
    print (definidoEm l trf) -- True
    print (definidoEm l'' trf) -- True
    print (definidoEm l' trf) -- True

    let e5 = ("geladeira", 1)
    let l''' = [e1, e2, e3, e4, e5]
    print (definidoEm l''' trf) -- False

    putStrLn ""
    print (precoDe l trf) -- 116
    -- print (precoDe [("maquina de lavar", 2), ("cafeteira", 1)] [("maquina de lavar", 3)]) -- tarifa não definida pra cafeteira

    putStrLn ""
    print(zeroVendas 6) -- 3
    print(zeroVendas 2) -- 2
    print(zeroVendas2 6) -- 0





