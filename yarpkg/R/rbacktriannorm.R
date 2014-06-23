#' author Maverick
#'
#' Generate random sample from Backtrain Gaussian distribution
#'
#' 
#' Generate random sample from Backtrain Gaussian distribution
#' @param n an integer 
#' @param mu a double number
#' @param sigma a double number
#' @param m a double number 
#' @return a double vector of length n 
#' @examples rbacktriannorm(20, mu = 0, sigma = 1, m = 0.95)
#'
#' @export



rbacktriannorm <-
function(n, mu = 0, sigma = 1, m = 0.5) {
  ind <- rbinom(n, 1, .5) * 2 - 1
  sd <- sqrt(1 - m^2) * sigma
  rnorm(n, mu, sd) + ind * m * sigma
}
