sum=0
for i in 1:1000
    sum+=(i%3==0||i%5==0)*i
end
println("sum is $sum")