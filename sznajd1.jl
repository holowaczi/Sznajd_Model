using Plots
using Random
function Sznajd_1D(size::Int64, iterations::Int)
    S0 = bitrand(size)
    results = falses(iterations,length(S0))
    results[1,:] = S0
    for t in 2:1000
        i = rand(2:length(S0)-2)
        S = results[t-1,:]
        if results[t-1,i]==results[t-1,i+1]
            S[i-1]=S[i]
            S[i+2]=S[i]
        else
            S[i-1]=S[i+1]
            S[i+2]=S[i]
        end
        results[t,:]=S
    end
    return results
end

results = Sznajd_1D(50,10^3)

heatmap(results, xlabel="Person", ylabel="Iter", yaxis=:flip, legend=false)