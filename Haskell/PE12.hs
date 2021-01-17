module PE12 where
    factorOut a b
        | a`mod`b/=0 = (a,0)
        | otherwise = (p,q+1)
            where (p,q)=factorOut (a`div`b) b
    cntDvs a b
        | a==1 = 1
        | b*b>a = 2
        | otherwise = (cntDvs p (b+1))*(q+1)
            where (p,q)=factorOut a b
    ans=head $ filter (\t->(cntDvs t 2)>500) [(t*(t+1))`div`2|t<-[1..]]