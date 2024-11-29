dobro :: Integer -> Integer 
dobro x = 2*x

quadruplo :: Integer -> Integer
quadruplo x = dobro 1 * dobro x

main :: IO ()
main = do
let quad = quadruplo 3
print(quad)