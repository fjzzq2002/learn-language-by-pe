module PE9 where
    ans=[a*b*(1000-a-b)|a<-[1..999],b<-[1..999],a<b,b<1000-a-b,a*a+b*b==(1000-a-b)*(1000-a-b)]