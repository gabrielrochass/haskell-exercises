addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos (n - 1)

main :: IO ()
main = do
    let x = addEspacos 3
    print(x) -- "   "
    
    let y = addEspacos 5
    print(y) -- "     "
    
    let z = addEspacos 0
    print(z) -- ""