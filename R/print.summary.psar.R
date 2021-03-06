#' @name print.summary.psar
#' @rdname print.summary.psar
#'
#' @title Print method for objects of class summary.psar.
#'
#' @param x object of class \emph{summary.psar}.
#' @param digits number of digits to show in printed tables.
#'   Default: max(3L, getOption("digits") - 3L).
#' @param ... further arguments passed to or from other methods.
#'
#' @author Roman Minguez \email{roman.minguez@@uclm.es}
#'
#' @seealso
#' \itemize{
#'   \item \code{\link{summary.psar}} Summary method for \emph{psar} objects.
#' }
#'
#' @examples
#'   See examples for \code{\link{psar}} function.
#' @export
print.summary.psar <- function(x, 
                  digits = max(3L, getOption("digits") - 3L), ...)
{
  cat("Call:\n")
  print(x$call)
  if(!is.null(x$coef_par_table)) {
    cat("\n Parametric Terms \n")
    printCoefmat(x$coef_par_table, P.values=TRUE, has.Pvalue=TRUE)
  }
  if(!is.null(x$coef_nopar_table)) {
    cat("\n Non-Parametric Terms \n")
    printCoefmat( x$coef_nopar_table, P.values=FALSE, has.Pvalue=FALSE)
  }
  if(!is.null(x$coef_spttrend_table)) {
    cat("\n Non-Parametric Spatio-Temporal Trend \n")
    printCoefmat( round(x$coef_spttrend_table,3),
                  P.values=FALSE, has.Pvalue=FALSE)
  }
  cat("\n Goodness-of-Fit \n")
  cat("\nEDF Total:",formatC(x$edftot,digits=6,width=6),
      " Sigma:",formatC(x$sigma,digits=6,width=6))
  cat("\nAIC:      ",formatC(x$aic,digits=6,width=6),
      "BIC: ",formatC(x$bic,digits=6,width=6))

  invisible(x)
}
