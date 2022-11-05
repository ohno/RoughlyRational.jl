module RoughlyRational

export 
    maybeinteger,
    roughlyRational

"""
    maybeinteger(x; ε=1e-12) -> Bool

Test whether `x` is numerically **roughly** equal to some integer like [`isinteger(x)`](https://github.com/JuliaLang/julia/blob/36034abf26062acad4af9dcec7c4fc53b260dbb4/base/number.jl#L20).
```jldoctest
julia> x = sin(2π)
julia> isinteger(x)
false
julia> maybeinteger(x)
true
```
"""
maybeinteger(x; ε=1e-12) = abs(x - round(x)) < ε

"""
    roughlyRational(x; i_max=100000, ε=1e-12) -> Bool

Rough [`Rational(x)`](https://github.com/JuliaLang/julia/blob/36034abf26062acad4af9dcec7c4fc53b260dbb4/base/rational.jl#L9).
```jldoctest
julia> Rational(0.499999)
9007181240342483//18014398509481984
julia> roughlyRational(0.499999)
1//2
```
"""
function roughlyRational(x; i_max=100000, ε=1e-12)
    if maybeinteger(x)
        return Integer(round(x))
    else
        i_ini = (x<0) ? -1 : 1
        for i in i_ini:(Int(sign(x))):(Int(sign(x))*i_max)
            if maybeinteger(x*i, ε=ε) # isinteger(x*i)
                return Int(round(x*i)) // i
            end
        end
        roughlyRational(x, i_max=i_max, ε=ε*10)
    end
end

end
