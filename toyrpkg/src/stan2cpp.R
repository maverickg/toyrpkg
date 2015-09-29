# this script can be put in rstan package 
library(rstan)
args <- commandArgs(trailingOnly = TRUE)
print(args)
model_cppname <- sub(".stan", "", args[1], fixed = TRUE)
a <- stanc(args[1], model_name = model_cppname, obfuscate_model_name = FALSE)
model_cppname <- paste0('model_', model_cppname)
cat(paste("#define STAN__SERVICES__COMMAND_HPP\n",
          a$cppcode, 
          "#include <rstan/rstaninc.hpp>\n",
          rstan:::get_Rcpp_module_def_code(model_cppname)),
    file = args[2])
