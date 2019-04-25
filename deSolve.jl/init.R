Sys.setenv(HTTP_PROXY = "http://webproxy.bfr.bund.de:8080")
Sys.setenv(HTTPS_PROXY = "https://webproxy.bfr.bund.de:8080")

library(XRJulia)
if(!findJulia(test = TRUE)){
  stop("Julia is not properly installed/configured.")
  #juliadir <- readline(prompt = "Enter directory path: ")
  #Sys.setenv(JULIA_BIN = "C:/Users/miller/AppData/Local/Julia-1.0.3/bin/Julia.exe")
  #Sys.setenv(JULIA_HOME = "C:/Users/miller/AppData/Local/Julia-1.0.3")
}else{
  juliadir <- findJulia(test = FALSE)
}

juliaCommand(expression(2+3))
