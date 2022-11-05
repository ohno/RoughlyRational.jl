# RoughlyRational.jl

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


## Examples

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
\begin{align}
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
&\vdots
\end{align}
```

`Rational(Float32(x))` replaces `roughlyRational(x)` but has an error:

```julia
# using SpecialPolynomials
# using Polynomials
# using Latexify
# using LaTeXStrings
for n in 4:4
    for k in 0:1
        # derivative of the Laguerre polynomials
        p = basis(Laguerre{0}, n)
        p = convert(Polynomial, p)
        p = derivative(p,k)
        p = Rational.(Float32.(p.coeffs))
        p = SimplePolynomial(p...)
        latexstring("L_n^k(x) = ", latexify("p", env=:raw, cdot=false)) |> display
        # Conversion from generalized Laguerre polynomials
        p = basis(Laguerre{k}, n-k)
        p = convert(Polynomial, p) * (-1)^k
        p = Rational.(Float32.(p.coeffs))
        p = SimplePolynomial(p...)
        latexstring("L_n^k(x) = ", latexify("p", env=:raw, cdot=false)) |> display
    end
end
```

```math
\begin{align}
L_4^0(x) &= \frac{1}{1} - \frac{4}{1} x + \frac{3}{1} x^{2} - \frac{11184811}{16777216} x^{3} + \frac{11184811}{268435456} x^{4} \\
L_4^0(x) &= \frac{1}{1} - \frac{4}{1} x + \frac{3}{1} x^{2} - \frac{11184811}{16777216} x^{3} + \frac{11184811}{268435456} x^{4} \\
L_4^1(x) &= \frac{-4}{1} + \frac{6}{1} x - \frac{2}{1} x^{2} + \frac{11184811}{67108864} x^{3} \\
L_4^1(x) &= \frac{-4}{1} + \frac{6}{1} x - \frac{2}{1} x^{2} + \frac{11184811}{67108864} x^{3} \\
&\vdots
\end{align}
```

`roughlyRational(x)` solves this problem.

```julia
# using SpecialPolynomials
# using Polynomials
# using Latexify
# using LaTeXStrings
for n in 4:4
    for k in 0:1
        # derivative of the Laguerre polynomials
        p = basis(Laguerre{0}, n)
        p = convert(Polynomial, p)
        p = derivative(p,k)
        p = roughlyRational.(p.coeffs)
        p = SimplePolynomial(p...)
        latexstring("L_n^k(x) = ", latexify("p", env=:raw, cdot=false)) |> display
        # Conversion from generalized Laguerre polynomials
        p = basis(Laguerre{k}, n-k)
        p = convert(Polynomial, p) * (-1)^k
        p = roughlyRational.(p.coeffs)
        p = SimplePolynomial(p...)
        latexstring("L_n^k(x) = ", latexify("p", env=:raw, cdot=false)) |> display
    end
end
```


```math
\begin{align}
L_4^0(x) &= \frac{1}{1} - \frac{4}{1} x + \frac{3}{1} x^{2} - \frac{2}{3} x^{3} + \frac{1}{24} x^{4} \\
L_4^0(x) &= \frac{1}{1} - \frac{4}{1} x + \frac{3}{1} x^{2} - \frac{2}{3} x^{3} + \frac{1}{24} x^{4} \\
L_4^1(x) &= \frac{-4}{1} + \frac{6}{1} x - \frac{2}{1} x^{2} + \frac{1}{6} x^{3} \\
L_4^1(x) &= \frac{-4}{1} + \frac{6}{1} x - \frac{2}{1} x^{2} + \frac{1}{6} x^{3} \\
&\vdots
\end{align}
```
