f=[1,2]
while f[end]<4000000
    append!(f,f[end-1]+f[end])
end
pop!(f)
print(sum(filter(x->(x%2==0),f)))