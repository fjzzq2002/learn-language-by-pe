module PE6 where
    ans=g*g-h
        where
            h=sum [n*n|n<-[1..100]]
            g=sum [1..100]