#' author Mav
#'
#' Evaludate the probabiliy density function of a Backtrain Gaussian
#' distribution 
#'
#' 
#' Evaludate the probabiliy density function of a Backtrain 
#' at specified values 
#' @param x a double vector 
#' @param mu a double number
#' @param sigma a double number
#' @param m a double number 
#' @return a double vector with the same lenth of x
#' @examples dbacktriannorm(1.0, mu = 0, sigma = 1, m = 0.95)
#'
#' @export


 dbacktriannorm <-
function(x, mu = 0, sigma = 1, m = 0.5) {
  sd <- sqrt(1 - m^2) * sigma
  0.5 * dnorm(x, mu - m * sigma, sd = sd) + 0.5 * dnorm(x, mu + m * sigma, sd = sd)
}
