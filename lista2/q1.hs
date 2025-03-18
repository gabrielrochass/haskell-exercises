--1) Dado uma função para classificar lista de a, se for Just a, a entra na lista final, se for nothing, a não entra.

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


main :: IO ()
main =  do
    let m = mapMaybe testFunc [2,3,1,0,-1,-232]
    print m