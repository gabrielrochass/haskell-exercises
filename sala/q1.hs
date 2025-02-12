sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (x:xs) = sublistas xs ++ map (x:) (sublistas xs)

main :: IO ()
main = do
  let x = sublistas [1,2,3,4]
  print(x)