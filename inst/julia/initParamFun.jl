using Pkg

function addPkg()
    try
        write(stderr, "Adding package ParameterizedFunctions.jl; expect some messages and some delay\n")
        Pkg.add("ParameterizedFunctions.jl")
        0
    catch err
        write(stderr, "Unable to add package ParameterizedFunctions.jl: ")
        showerror(stderr, err)
        1
    end
end

try
    using ParameterizedFunctions
    exit(0)
catch err
    exit(addPkg())
end
