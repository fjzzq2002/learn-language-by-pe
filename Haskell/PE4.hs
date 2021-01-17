module PE4 where
    {-ispal [] = True
    ispal (p:q)
        |q==[] = True
        |p==(last q) = ispal(init q)
        |otherwise = False-}
    ispal p = p == (reverse p)
    ans=maximum $ filter (ispal.show) [p*q|p<-[100..999],q<-[100..999]]