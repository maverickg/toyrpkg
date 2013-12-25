
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>

#ifdef __cplusplus
extern "C" {
#endif

SEXP C_testf(SEXP a1);
SEXP C_testfb(SEXP b1);

#ifdef __cplusplus
}
#endif

SEXP C_testf(SEXP a1) {
  return a1;
}

SEXP C_testfb(SEXP b1) {
  return b1;
}

#define CALLDEF(name, n)  {#name, (DL_FUNC) &name, n}

static const R_CallMethodDef CallEntries[] = {
  CALLDEF(C_testf, 1),
  /*CALLDEF(C_testfb, 1),*/
  {NULL, NULL, 0}
};


void attribute_visible R_init_toyrpkg(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
  R_forceSymbols(dll, TRUE);
}
