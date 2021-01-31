using Documenter
using CommutativeFunctions

DocMeta.setdocmeta!(CommutativeFunctions, :DocTestSetup, :(using CommutativeFunctions); recursive=true)

makedocs(;
    modules=[CommutativeFunctions],
    authors="Jishnu Bhattacharya",
    repo="https://github.com/jishnub/CommutativeFunctions.jl/blob/{commit}{path}#L{line}",
    sitename="CommutativeFunctions.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jishnub.github.io/CommutativeFunctions.jl",
        assets=String[],
    ),
    pages=[
        "API" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jishnub/CommutativeFunctions.jl",
    devbranch = "main",
)
