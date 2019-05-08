using Pkg

function addPkg()
    try
        write(stderr, "Adding package DifferentialEquations.jl; expect some messages and some delay\n")
        Pkg.add("DifferentialEquations.jl")
        0
    catch err
        write(stderr, "Unable to add package DifferentialEquations.jl: ")
        showerror(stderr, err)
        1
    end
end

try
    using DifferentialEquations
    exit(0)
catch err
    exit(addPkg())
end
