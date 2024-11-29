tribonacci :: Int -> Int
tribonacci 0 = 0
tribonacci 1 = 1
tribonacci 2 = 1
tribonacci 3 = 2
tribonacci n = tribonacci (n - 1) + tribonacci (n - 2) + tribonacci (n - 3)

main :: IO ()
main = do
    let x = tribonacci 0
    print(x) -- 0

    let y = tribonacci 1
    print(y) -- 1

    let z = tribonacci 2
    print(z) -- 1

    let w = tribonacci 3
    print(w) -- 2

    let a = tribonacci 4
    print(a) -- 4

    let b = tribonacci 5
    print(b) -- 7

    let c = tribonacci 6
    print(c) -- 13

    let d = tribonacci 7
    print(d) -- 24

    let e = tribonacci 8
    print(e) -- 44

    let f = tribonacci 9
    print(f) -- 81

    let g = tribonacci 10
    print(g) -- 149