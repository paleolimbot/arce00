
#include "avc.h"
#include <Rinternals.h>

/**********************************************************************
 *                          ConvertCover()
 *
 * Create a binary coverage from an E00 file.
 *
 * It would be possible to have an option for the precision... coming soon!
 **********************************************************************/
void ConvertCover(FILE *fpIn, const char *pszCoverName,
                  AVCCoverType eCoverType)
{
  AVCE00WritePtr hWriteInfo;
  const char *pszLine;

  hWriteInfo = AVCE00WriteOpen(pszCoverName, eCoverType, AVC_DEFAULT_PREC);

  if (hWriteInfo)
  {
    while (CPLGetLastErrorNo() == 0 &&
           (pszLine = CPLReadLine(fpIn) ) != NULL )
    {
      AVCE00WriteNextLine(hWriteInfo, pszLine);
    }

    AVCE00WriteClose(hWriteInfo);
  }
}

SEXP arce00_c_convert(SEXP filenameIn, SEXP pathOut, SEXP coverageType) {
  const char  *pszCoverPath, *pszInFile;
  FILE        *fpIn;

  pszInFile   = CHAR(STRING_ELT(filenameIn, 0));
  pszCoverPath = CHAR(STRING_ELT(pathOut, 0));

  AVCCoverType eCoverType;
  if (INTEGER(coverageType)[0] == 1) {
    eCoverType = AVCCoverV7;
  } else if(INTEGER(coverageType)[0] == 2) {
    eCoverType = AVCCoverPC;
  } else {
    Rf_error("coverageType must be 1 (V7) or 2 (PC) in arce00_c_convert()");
  }

  fpIn = fopen(pszInFile, "rt");
  if (fpIn == NULL) {
    Rf_error("avcimport: Cannot open %s", pszInFile);
  }

  ConvertCover(fpIn, pszCoverPath, eCoverType);

  return R_NilValue;
}
