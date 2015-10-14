

get_code <- function(model = c("a", "b"), type = c("stancode", "cppcode")) {
  suffix <- sub("code", '', type, fixed = TRUE)
  file <- file.path(system.file('misc', package = 'toyrpkg'), type, paste0(model, '.', suffix))
  code <- readLines(file)
  paste0(code, collapse = '\n')
}

mk_sm <- function(model = c("a", "b")) {
  model <- match.arg(model)
  mod <- list(a = stan_fit4model_a, b = stan_fit4model_b)[[model]]

  dummydso <- NA; class(dummydso) <- "cxxdso"

  obj <- new("stanmodel", 
             model_name = model,
             model_code = get_code(model = model, type = "stancode"),
             dso = dummydso,
             mk_cppmodule = function(x) { mod },
             model_cpp = list(model_cppname = paste0("model_", model),
                              model_cppcode = get_code(model = model, type = 'cppcode')))
  obj
}

sim <- function(model = c("a", "b")) {
  sm <- mk_sm(model);
  sampling(sm)
}
