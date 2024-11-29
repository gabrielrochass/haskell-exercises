parImpar :: Integer -> String
parImpar x = if mod x 2 == 0 
    then "Par" 
    else "Impar"

main :: IO ()
main = do
    let x = parImpar 3
    print(x) -- Impar

    let y = parImpar 4
    print(y) -- Par