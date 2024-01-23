#' Create MUKEY Look-up Table
#'
#' Creates a look-up table of MUKEY and AREASYMBOL, possibly subject to optional `WHERE` clause condition.
#'
#' @param WHERE Optional: SQL where clause targeting `legend` or `mapunit` level attributes.
#'
#' @return data.frame containing `"mukey"` and `"areasymbol"` columns
#' @export
#' @examples
#' \dontrun{
#' create_mukey_lut(WHERE = "areasymbol = 'CA041'")
#' }
create_mukey_lut <- function(WHERE = NULL) {
  q <- "SELECT DISTINCT mukey, areasymbol FROM legend
        INNER JOIN mapunit ON legend.lkey = mapunit.lkey"
  if (!is.null(WHERE)) {
    q <- paste(q, "WHERE", WHERE)
  }
  # TODO: expose unexported method as argument via SDA_query()?
  mukey_lut <- do.call(".SDA_query_FOR_JSON_AUTO", q, envir = asNamespace("soilDB"))
  mukey_lut$areasymbol <- unlist(mukey_lut$legend)
  mukey_lut$legend <- NULL
  mukey_lut
}
