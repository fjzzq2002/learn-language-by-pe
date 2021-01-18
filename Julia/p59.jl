f1=open("words_alpha.txt")
words=Set{String}()
for w in readlines(f1)
    push!(words,w)
end
println("# of words: $(length(words))");
f2=open("p059_cipher.txt")
cipher=read(f2,String) # if `String` is not supplied, it will be considered as a json-like array
# cipher=map(x->parse(Int32,x),convert(Array{String},split(cipher,",")))
cipher=map(split(cipher,",")) do x
    parse(Int32,x)
end
t=zeros(Int32,3)
ans=(0,"")
for t[1] in 'a':'z'
    for t[2] in 'a':'z'
        for t[3] in 'a':'z'
            dec=convert(Array{Char},map(x->cipher[x]⊻t[x%3+1],1:length(cipher)))|>String
            cnt_word=0
            tot_spl=0
            sp=split(dec," ")
            for u in sp
                cnt_word+=in(u,words)
                tot_spl+=1
            end
            global ans=max(ans,(cnt_word,dec)) # https://docs.julialang.org/en/v1/manual/variables-and-scoping/, stupid design imo
        end
    end
end
println("$ans")
println("sum of ascii: $(sum(map(x->Int(x),collect(ans[2]))))")