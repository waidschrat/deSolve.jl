#' @title Initialize Julia and required packages
#' @description Function to set the Julia path manually and
#' to load all required Julia packages.
#' @param check logical, indicate if package checks should be performed (optional).
#' @param path character, system path to Julia binary (optional).

#' @return logical, TRUE when initialization of Julia succeeded
#'
#' @examples
#' \dontrun{
#' deInit(julia_bin = findJulia())
#' }

deInit <- function(check=TRUE, path=NULL) {
  if(!is.null(path)) Sys.setenv(JULIA_BIN = path) #set path environment variable
  if(!findJulia(test = TRUE)) stop('Unable to initialize Julia - check path or run findJulia(T) for further information')

  if(check){
    testFile <- system.file("julia", "initDiffEq.jl", package = .packageName)
    if(XRJulia:::juliaCMD(path, testFile) > 0)
      stop('Unable to load DifferentialEquations.jl - try Pkg.add("DifferentialEquations") from Julia directly')

    testFile <- system.file("julia", "initParamFun.jl", package = .packageName)
    if(XRJulia:::juliaCMD(path, testFile) > 0)
      stop('Unable to load ParameterizedFunctions.jl - try Pkg.add("ParameterizedFunctions") from Julia directly')
  }

  juliaUsing("DifferentialEquations, ParameterizedFunctions")
  return(TRUE)
}
