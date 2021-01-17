module PE102 where
    import System.IO
    parseline s=
        (x>0&&y>0&&z>0)||(x<0&&y<0&&z<0)
        where
            (a,b,c,d,e,f)=read ("("++s++")") :: (Int,Int,Int,Int,Int,Int)
            x=a*d-b*c
            y=c*f-d*e
            z=e*b-f*a
    run = do
        handle <- openFile "p102_triangles.txt" ReadMode
        g <- hGetContents handle
        print $ length $ filter (==True) $ map parseline $ lines g
        hClose handle
