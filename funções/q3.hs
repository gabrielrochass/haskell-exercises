poli2 :: Double -> Double -> Double -> Double -> Double --assinatura
poli2 a b c x = a*x^2 + b*x + c --definição

main :: IO ()
main = do
    let x = poli2 1.0 2.0 1.0 2.0
    print(x) -- 9.0
    