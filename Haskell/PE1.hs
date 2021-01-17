module PE1 where
    -- ans=show (sum (filter (\u->u`mod`3==0||u`mod`5==0) [1..1000]))
    arr=[n|n<-[1..1000],n`mod`3==0||n`mod`5==0]
    ans=show(sum arr)
    work=do putStrLn ans