library(inline)
library(toyrpkg)

sampler<- new(stan_fit4model_a, list(), function() { TRUE } )

args <- list(init = list(y = 2)) 
s <- try(sampler$call_sampler(args)) 
str(s)
print(mean(s$y))

samplerb<- new(stan_fit4model_b, list(), function() { TRUE } )

sb <- try(samplerb$call_sampler(args)) 
str(sb)
print(mean(sb$y))


