dobro :: Integer -> Integer 
dobro x = 2*x

main :: IO ()
main = do
let x = dobro 3
print(x)