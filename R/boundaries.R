es_validate_boundary <- function(dsn,
                                 areasymbol = NULL,
                                 mupolygon = "MUPOLYGON",
                                 sapolygon = "SAPOLYGON") {
  # dsn <- "D:/CA/gSSURGO_CA_FY2024.gdb"
  x <- sf::st_read(dsn, sapolygon)

  if (!is.null(areasymbol)) {
    xx <- x[grep(paste0(areasymbol, collapse = "|")),]
  } else xx <- x

  ssab <- sf::st_union(xx)

  y <- x[relate(x, buffer(ssab, 1), "intersects"),]
  plot(y)

  z <- vect(, "MUPOLYGON", proxy = TRUE)
  zz <- query(z, filter = y)

}
