library(Rcpp)
library(inline)

sessionInfo()

inc <- '
void testf(const Rcpp::List& a) {
  Rcpp::Rcout << a.size() << std::endl;
std::string aname("a");
  Rcpp::List& b = const_cast<Rcpp::List&>(a);
  Rcpp::List& c(const_cast<Rcpp::List&>(a));
  Rcpp::Rcout << Rcpp::as<int>(a[aname]) << std::endl;
  Rcpp::Rcout << Rcpp::as<int>(b[aname]) << std::endl;
  Rcpp::Rcout << Rcpp::as<int>(c[aname]) << std::endl;
}
'

src <- '
  testf(Rcpp::as<Rcpp::List>(a));
  Rcpp::List b = Rcpp::List::create(_["a"] = 3);
  b["test"] = 4;
  Rcpp::NumericVector grad = Rcpp::wrap(3);
  grad.attr("log_prob") = 4;
'

fx <- cxxfunction(signature(a = 'list'), body = src, includes = inc,
                  plugin = 'Rcpp', verbose = TRUE)

ll <- list(a=1L, b=list(b1=2), c=rnorm(3), d=list(d1=4));
fx(ll)
