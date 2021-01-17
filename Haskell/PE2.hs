module PE2 where
    fib::[Int]
    fib=[1]++[2]++ zipWith (+) fib (tail fib)
    sums (x:xs)
        |x<=4000000 = x*(1-x`mod`2)+sums xs
        |otherwise = 0
    ans=sums fib
