module PE3 where
    lp x u
        |x==1 = [1]
        |u==x = [x]
        |x`mod`u==0 = [u]++lp (div x u) 2
        |otherwise = lp x (u+1)
    ans=lp (600851475143::Integer) 2
