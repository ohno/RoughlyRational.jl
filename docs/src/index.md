```@meta
CurrentModule = RoughlyRational
```

# RoughlyRational.jl

Documentation for [RoughlyRational.jl](https://github.com/ohno/RoughlyRational.jl).

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

```@setup usage
using RoughlyRational
```

`maybeinteger(x)` and `RoughlyRational(x)` are available. `maybeinteger(x)` can determine whether `x` is an integer or not, more roughly than `isinteger(x)`:

```@repl usage
x = sin(2π)
isinteger(x)
maybeinteger(x)
```

`roughlyRational` can convert `x` to a rational number more roughly than `Rational(x)`:

```@repl usage
Rational(0.499999)
roughlyRational(0.499999)
```

```@docs
roughlyRational
```