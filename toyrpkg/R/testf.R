testf <-
function(x) {
  .Call("C_testf", x)
}

testfb <-
function(x) {
  .Call("C_testfb", x)
}

testfb2 <-
function(x) {
  .Call("C_testfb", x, PACKAGE = 'toyrpkg')
}
