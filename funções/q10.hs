binomial :: Int -> Int -> Int
binomial _ 0 = 1
binomial 0 _ = 0
binomial n k = binomial (n - 1) k + binomial (n - 1) (k - 1)

main :: IO ()
main = do
    let x = binomial 5 2
    print(x) -- 10

    let y = binomial 5 3
    print(y) -- 10

    let z = binomial 5 4
    print(z) -- 5