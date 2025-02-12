import Control.Monad.RWS (MonadState(put))
-- a)
poliFunc :: Integer -> Integer -> Integer -> (Integer -> Integer)
poliFunc a b c = \x -> a*(x)^2 + b*x + c

-- b)
listaPoli :: [(Integer, Integer, Integer)] -> [Integer -> Integer]
listaPoli [] = []
listaPoli ((a,b,c):xs) = poliFunc a b c : listaPoli xs


-- c)
app


main :: IO ()
main = do
    let y = poliFunc 1 2 3 
    print(y 2)

    putStrLn ""

    let x = listaPoli [(1,2,3),(4,5,6),(7,8,9)]
    mapM_ print (map (\f -> f 2) x)



