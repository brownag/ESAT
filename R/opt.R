#' Set Path to SSURGO Database
#'
#' Either File Geodatabase or GeoPackage/SpatiaLite database supported.
#'
#' @param x character. Path to File Geodatabase or GeoPackage/SpatiaLite database.
#' @param mupolygon character. name of the MUPOLYGON or SAPOLYGON layer within `x`.
#' @param sapolygon character. name of the MUPOLYGON or SAPOLYGON layer within `x`.
#'
#' @rdname ESSAT-options
#' @export
es_set_ssurgo_source <- function(x, mupolygon = NULL, sapolygon = NULL) {
  options(ESSAT.ssurgo_source = x)

  if (!is.null(mupolygon))
    es_set_mupolygon_layer(mupolygon)
  if (!is.null(sapolygon))
    es_set_sapolygon_layer(sapolygon)

  invisible(options()[c("ESSAT.ssurgo_source",
                        "ESSAT.mupolygon_layer"[!is.null(mupolygon)],
                        "ESSAT.sapolygon_layer"[!is.null(sapolygon)])])
}

#' @rdname ESSAT-options
#' @export
es_set_mupolygon_layer <- function(x) {
  options(ESSAT.mupolygon_layer = x)
  invisible(es_get_mupolygon_layer())
}

#' @rdname ESSAT-options
#' @export
es_get_mupolygon_layer <- function() {
  getOption("ESSAT.mupolygon_layer", default = "MUPOLYGON")
}

#' @rdname ESSAT-options
#' @export
es_set_sapolygon_layer <- function(x) {
  options(ESSAT.sapolygon_layer = x)
  invisible(es_get_sapolygon_layer())
}

#' @rdname ESSAT-options
#' @export
es_get_sapolygon_layer <- function() {
  getOption("ESSAT.sapolygon_layer", default = "SAPOLYGON")
}
