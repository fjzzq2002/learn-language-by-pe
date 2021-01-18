f=ones(10000000)
primes=[]
for u in 2:10000000 # this is actually pretty fast
    if f[u]==1
        append!(primes,u)
        for w in u*u:u:10000000
            f[w]=0
        end
    end
end
print(primes[10001])
