module PE7 where
    sieve a b -- nobody cares about time complexity!
        |b==[] = []
        |(head b)>a = sieve (a+1) b -- a can't be prime
        |(head b)==a = (head b):(sieve (a+1) (filter (\e->(e`mod`a)/=0) (tail b)))
        |otherwise = sieve (a+1) (filter (\e->(e`mod`a)/=0) b)
    primes=sieve 2 [2..]
    ans=primes!!10000 -- this will take a while...