# RoughlyRational

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://ohno.github.io/RoughlyRational.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ohno.github.io/RoughlyRational.jl/dev/)
[![Build Status](https://travis-ci.com/ohno/RoughlyRational.jl.svg?branch=main)](https://travis-ci.com/ohno/RoughlyRational.jl)
[![Coverage](https://codecov.io/gh/ohno/RoughlyRational.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ohno/RoughlyRational.jl)
[![Coverage](https://coveralls.io/repos/github/ohno/RoughlyRational.jl/badge.svg?branch=main)](https://coveralls.io/github/ohno/RoughlyRational.jl?branch=main)


## Installation

For the first time only, run the following code in your Jupyter Notebook:

```julia
using Pkg
Pkg.add(path="https://github.com/ohno/RoughlyRational.jl")
```

or use `add` upon Pkg REPL:

```julia
]
add https://github.com/ohno/RoughlyRational.jl
```

## Usage

To use this package, run the following code in your Jupyter Notebook or code:

```julia
using RoughlyRational
```

`maybeinteger(x)` and `RoughlyRational(x)` are available.


### Examples

`maybeinteger(x)` can determine whether `x` is an integer or not, more roughly than `isinteger(x)`:

```julia
julia> x = sin(2π)
-2.4492935982947064e-16
julia> isinteger(x)
false
julia> maybeinteger(x)
true
```

`roughlyRational` can convert `x` to a rational number more roughly than `Rational(x)`:

```julia
julia> Rational(0.499999)
9007181240342483//18014398509481984
julia> roughlyRational(0.499999)
1//2
```

Several packages allow to display Legendre polynomials:

```julia
# using Pkg
# Pkg.add("SpecialPolynomials")
# Pkg.add("Polynomials")
# Pkg.add(path="https://github.com/ohno/RoughlyRational.jl")
# Pkg.add("SimplePolynomials")
# Pkg.add("LaTeXStrings")
# Pkg.add("Latexify")
using SpecialPolynomials
using Polynomials
using RoughlyRational
using SimplePolynomials
using LaTeXStrings
using Latexify

for n in 0:15
    p = basis(Legendre, n)
    q = convert(Polynomial, p)
    r = roughlyRational.(q.coeffs)
    s = SimplePolynomial(r...)
    latexstring("P_{$n}(x) = ", latexify("$s", env=:raw, cdot=false)) |> display
end
```
```math
\begin{align} \\
P_{0}(x) &= 1 \\
P_{1}(x) &= x \\
P_{2}(x) &= \frac{-1}{2} + \frac{3}{2} x^{2} \\
P_{3}(x) &= \frac{-3}{2} x + \frac{5}{2} x^{3} \\
P_{4}(x) &= \frac{3}{8} - \frac{15}{4} x^{2} + \frac{35}{8} x^{4} \\
P_{5}(x) &= \frac{15}{8} x - \frac{35}{4} x^{3} + \frac{63}{8} x^{5} \\
P_{6}(x) &= \frac{-5}{16} + \frac{105}{16} x^{2} - \frac{315}{16} x^{4} + \frac{231}{16} x^{6} \\
P_{7}(x) &= \frac{-35}{16} x + \frac{315}{16} x^{3} - \frac{693}{16} x^{5} + \frac{429}{16} x^{7} \\
P_{8}(x) &= \frac{35}{128} - \frac{315}{32} x^{2} + \frac{3465}{64} x^{4} - \frac{3003}{32} x^{6} + \frac{6435}{128} x^{8} \\
P_{9}(x) &= \frac{315}{128} x - \frac{1155}{32} x^{3} + \frac{9009}{64} x^{5} - \frac{6435}{32} x^{7} + \frac{12155}{128} x^{9} \\
P_{10}(x) &= \frac{-63}{256} + \frac{3465}{256} x^{2} - \frac{15015}{128} x^{4} + \frac{45045}{128} x^{6} - \frac{109395}{256} x^{8} + \frac{46189}{256} x^{10} \\
P_{11}(x) &= \frac{-693}{256} x + \frac{15015}{256} x^{3} - \frac{45045}{128} x^{5} + \frac{109395}{128} x^{7} - \frac{230945}{256} x^{9} + \frac{88179}{256} x^{11} \\
P_{12}(x) &= \frac{231}{1024} - \frac{9009}{512} x^{2} + \frac{225225}{1024} x^{4} - \frac{255255}{256} x^{6} + \frac{2078505}{1024} x^{8} - \frac{969969}{512} x^{10} + \frac{676039}{1024} x^{12} \\
P_{13}(x) &= \frac{3003}{1024} x - \frac{45045}{512} x^{3} + \frac{765765}{1024} x^{5} - \frac{692835}{256} x^{7} + \frac{4849845}{1024} x^{9} - \frac{2028117}{512} x^{11} + \frac{1300075}{1024} x^{13} \\
P_{14}(x) &= \frac{-429}{2048} + \frac{45045}{2048} x^{2} - \frac{765765}{2048} x^{4} + \frac{4849845}{2048} x^{6} - \frac{14549535}{2048} x^{8} + \frac{22309287}{2048} x^{10} - \frac{16900975}{2048} x^{12} + \frac{5014575}{2048} x^{14} \\
P_{15}(x) &= \frac{-6435}{2048} x + \frac{255255}{2048} x^{3} - \frac{2909907}{2048} x^{5} + \frac{14549535}{2048} x^{7} - \frac{37182145}{2048} x^{9} + \frac{50702925}{2048} x^{11} - \frac{35102025}{2048} x^{13} + \frac{9694845}{2048} x^{15} \\
\end{align}
```