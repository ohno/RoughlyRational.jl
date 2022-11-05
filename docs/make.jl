using RoughlyRational
using Documenter

DocMeta.setdocmeta!(RoughlyRational, :DocTestSetup, :(using RoughlyRational); recursive=true)

makedocs(;
    modules=[RoughlyRational],
    authors="Shuhei Ohno <ohno.github@gmail.com> and contributors",
    repo="https://github.com/ohno/RoughlyRational.jl/blob/{commit}{path}#{line}",
    sitename="RoughlyRational.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ohno.github.io/RoughlyRational.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ohno/RoughlyRational.jl",
    devbranch="main",
)
