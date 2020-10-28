
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP arce00_c_convert(SEXP filenameIn, SEXP pathOut, SEXP coverageType);

static const R_CallMethodDef CallEntries[] = {
  {"arce00_c_convert", (DL_FUNC) &arce00_c_convert, 3},
  {NULL, NULL, 0}
};

void R_init_arce00(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
