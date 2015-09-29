library(inline)
library(toyrpkg)

sampler<- new(stan_fit4model_a, list(), function() { TRUE } )

args <- list(init = list(y = 2)) 
s <- try(sampler$call_sampler(args)) 
str(s)


