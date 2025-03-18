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