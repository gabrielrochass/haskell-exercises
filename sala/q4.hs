ehMatriz :: [[a]] -> Bool
ehMatriz [[]] = True
ehMatriz m = and [length x == length z | z <- xs]


