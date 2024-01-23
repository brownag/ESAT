
# ld <- list.dirs("D:/SWR2023/SSURGO2023")[2:20]
# ld <- ld[!grepl("AS|FM|GU|HI|MP|PW", ld)]

#' Build ESPOLYGON From One or More Source SSURGO Databases
#'
#' @param dsn character. Path to one or more File Geodatabase, GeoPackage or SpatiaLite databases.
#' @param esagg data.frame containing "all" condition aggregation.
#' @param filename Output filename (e.g. a new or existing GeoPackage or SQLite file, or any OGR data source that supports appending data)
#' @param mupolygon character. Name of mapunit polygon geometry layer; default `"MUPOLYGON"` via `es_get_mupolygon_layer()`
#' @param query Optional: Query to read only a subset of mapunit polygon geometry source in `dsn.` Default `NA` to read whole layer.
#' @param by.dsn Default: `"MUKEY"`
#' @param by.agg Default: `"mukey"`
#'
#' @return If `filename` exists after writ
#' @export
#' @importFrom sf st_read st_write
create_espolygon <- function(dsn, esagg, filename,
                             mupolygon = es_get_mupolygon_layer(),
                             query = NA,
                             by.dsn = "MUKEY", by.agg = "mukey") {
  ins <- FALSE

  for (i in dsn) {
    v <- sf::st_read(i, mupolygon, query =  query)

    ### option for alternate projection?
    # v <- sf::st_transform(v, "EPSG:4326") # NB: pacific islands gSSURGO use EPSG:4326

    sf::st_write(merge(v, esagg[which(esagg[[by.agg]] %in% v[[by.dsn]]), ],
                       by.x = by.dsn, by.y = by.agg),
                 dsn = filename, append = ins)
    ins <- TRUE
  }

  if (file.exists(filename)) {
    filename
  } else NULL
}
