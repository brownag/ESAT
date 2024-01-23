#' Generate Wide Comparison Data Frame with "new" and "old" suffixes
#'
#' @param old data.frame containing "old" assignments with "all" condition aggregation
#' @param new data.frame containing "new" assignments with "all" condition aggregation
#' @param suffixes character. Length `2`. Default: `c(".new", ".old")`
#' @param by character. Columns used for joining `old` and `new`. Default: `"MUKEY"`
#'
#' @return data.frame with columns ending with `suffixes` depending on old vs. new source.
#' @export
es_compare_old_new <- function(old, new, suffixes = c(".new", ".old"), by = "MUKEY") {
  merge(data.table::data.table(new), old,
        all.x = TRUE, sort = FALSE,
        suffixes = suffixes, by = by)
}

#
#' Methods for Comparing Old and New ES Assignments
#'
#'   - `es_check_site_changed()`: check sites that changed between two data sources (i.e. name and ID are different)
#'
#' @param x data.frame result from `es_compare_old_new()` or similar
#' @param topn Number of sites to consider in comparison. Default is the first 4 conditions.
#'
#' @return logical matrix.
#' @rdname es-compare-methods
#' @export
es_check_site_changed <- function(x, topn = 4L) {
  sapply(seq(topn), function(i) {
    !is.na(x[[paste0("site", i, ".new")]]) &
      !is.na(x[[paste0("site", i, ".old")]]) &
      x[[paste0("site", i, ".new")]] != x[[paste0("site", i, ".old")]] &
      x[[paste0("site", i, "name.new")]] != x[[paste0("site", i, "name.old")]]
  })
}

#' @description
#' - `es_check_new_assignnment()`: visualize new assignments e.g. `old == "Not assigned"` -> `new == something`)
#'
#' @rdname es-compare-methods
#' @export
es_check_new_assignnment <- function(x, topn = 4L) {
  sapply(seq(topn), function(i) {
    !is.na(x[[paste0("site", i, ".new")]]) &
      !is.na(x[[paste0("site", i, ".old")]]) &
      x[[paste0("site", i, ".new")]] != x[[paste0("site", i, ".old")]] &
      x[[paste0("site", i, "name.new")]] != x[[paste0("site", i, "name.old")]]
  })
}

# tabulate compositional labels (top n classes, summing to >=70% comppct_r, alpha sorted)
#' @description
#' - `es_check_top_n()`: tabulate compositional labels (top n classes)
#'
#' @rdname es-compare-methods
es_check_top_3 <- function(x) {
  # TODO: export es_check_top_n() after generalizing
  y <- c(x$site1.new, x$site2.new, x$site3.new)
  y <- y[!is.na(y) & y != "Not assigned"]
  yy <- c(x$site1.old, x$site2.old, x$site3.old)
  yy <- yy[!is.na(yy) & yy != "Not assigned"]
  z <- c(x$site1pct_r.new, x$site2pct_r.new, x$site3pct_r.new)
  zz <- c(x$site1pct_r.old, x$site2pct_r.old, x$site3pct_r.old)
  data.table::data.table(areasymbol = x$AREASYMBOL.new,
                         musym = x$MUSYM.new,
                         mukey = x$MUKEY.new,
                         nationalmusym = x$nationalmusym.new,
                         top3.new = paste0(sort(y), collapse = "/"),
                         top3.old = paste0(sort(yy), collapse = "/"),
                         top3pct.new =  sum(z, na.rm = TRUE),
                         top3pct.old =  sum(zz, na.rm = TRUE))
}
