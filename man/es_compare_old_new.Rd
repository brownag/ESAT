% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare.R
\name{es_compare_old_new}
\alias{es_compare_old_new}
\title{Generate Wide Comparison Data Frame with "new" and "old" suffixes}
\usage{
es_compare_old_new(old, new, suffixes = c(".new", ".old"), by = "MUKEY")
}
\arguments{
\item{old}{data.frame containing "old" assignments with "all" condition aggregation}

\item{new}{data.frame containing "new" assignments with "all" condition aggregation}

\item{suffixes}{character. Length \code{2}. Default: \code{c(".new", ".old")}}

\item{by}{character. Columns used for joining \code{old} and \code{new}. Default: \code{"MUKEY"}}
}
\value{
data.frame with columns ending with \code{suffixes} depending on old vs. new source.
}
\description{
Generate Wide Comparison Data Frame with "new" and "old" suffixes
}
