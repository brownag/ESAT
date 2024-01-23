
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ESAT (Ecological Site Analytical Tools)

<!-- badges: start -->
<!-- badges: end -->

The goal of ESAT is to provide tools for analysis of the tabular and
spatial configuration of Ecological Site Concepts in SSURGO (Soil Survey
Geographic Database) products. ..

## Installation

You can install the development version of ESAT like so:

``` r
remotes::install_github("brownag/ESAT")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ESAT)

# get "all" condition aggregation via Soil Data Access for selected soil survey area(s)
x <- es_aggregate_ssurgo("CA041")
#> single result set, returning a data.frame

# decompose dominant condition site codes 
es_decompose_site_code(x$site1)
#>     kind mlra unit number state
#> 1      R  014   XC    008    CA
#> 2      R  014   XG    912    CA
#> 3      R  015   XY    009    CA
#> 4   <NA> <NA> <NA>   <NA>  <NA>
#> 5      R  015   XC    025    CA
#> 6      R  015   XC    037    CA
#> 7      R  015   XC    037    CA
#> 8      R  015   XC    010    CA
#> 9      R  015   XY    009    CA
#> 10     F  015   XY    010    CA
#> 11     F  015   XY    010    CA
#> 12     F  015   XY    010    CA
#> 13     R  015   XC    025    CA
#> 14     R  015   XC    033    CA
#> 15     R  015   XC    028    CA
#> 16     R  015   XC    028    CA
#> 17     R  015   XC    028    CA
#> 18     R  015   XC    028    CA
#> 19     F  004   BM    101    CA
#> 20     F  004   BM    101    CA
#> 21     F  004   BM    101    CA
#> 22  <NA> <NA> <NA>   <NA>  <NA>
#> 23     R  015   XC    034    CA
#> 24     R  015   XC    034    CA
#> 25     R  015   XC    034    CA
#> 26     R  015   XC    034    CA
#> 27  <NA> <NA> <NA>   <NA>  <NA>
#> 28     R  015   XC    010    CA
#> 29     R  015   XC    035    CA
#> 30     F  015   XY    001    CA
#> 31     R  015   XY    002    CA
#> 32     R  015   XY    009    CA
#> 33     R  015   XY    009    CA
#> 34     R  015   XY    009    CA
#> 35     R  015   XY    009    CA
#> 36     R  015   XC    030    CA
#> 37     R  015   XC    030    CA
#> 38     R  015   XC    026    CA
#> 39     R  015   XC    026    CA
#> 40     R  015   XC    032    CA
#> 41     R  015   XC    032    CA
#> 42     R  015   XC    032    CA
#> 43     R  015   XY    009    CA
#> 44     R  015   XY    009    CA
#> 45     R  015   XC    039    CA
#> 46     R  015   XC    036    CA
#> 47     R  014   XG    903    CA
#> 48     R  015   XC    028    CA
#> 49     R  015   XC    028    CA
#> 50     R  015   XC    028    CA
#> 51     R  015   XC    031    CA
#> 52     R  015   XC    031    CA
#> 53     F  004   BM    102    CA
#> 54     F  004   BM    102    CA
#> 55     F  004   BM    102    CA
#> 56     F  004   BM    102    CA
#> 57     R  015   XY    009    CA
#> 58     R  014   XC    007    CA
#> 59  <NA> <NA> <NA>   <NA>  <NA>
#> 60     R  015   XC    025    CA
#> 61     R  015   XC    034    CA
#> 62     R  015   XC    034    CA
#> 63     R  015   XC    034    CA
#> 64     R  015   XC    034    CA
#> 65     R  015   XY    009    CA
#> 66     R  015   XY    009    CA
#> 67     R  015   XY    009    CA
#> 68     R  015   XY    009    CA
#> 69     R  015   XY    009    CA
#> 70     R  015   XC    015    CA
#> 71     R  015   XC    015    CA
#> 72     R  015   XC    015    CA
#> 73     R  015   XC    034    CA
#> 74     R  015   XC    034    CA
#> 75     R  015   XC    027    CA
#> 76     R  015   XC    027    CA
#> 77     R  015   XC    027    CA
#> 78     R  015   XY    009    CA
#> 79     R  015   XY    009    CA
#> 80     R  015   XY    009    CA
#> 81     R  015   XY    009    CA
#> 82     R  015   XY    009    CA
#> 83     R  015   XY    009    CA
#> 84     R  015   XY    009    CA
#> 85     R  015   XY    009    CA
#> 86     R  015   XY    009    CA
#> 87     R  015   XY    009    CA
#> 88     R  015   XY    009    CA
#> 89     R  015   XY    009    CA
#> 90     R  015   XC    028    CA
#> 91     R  015   XC    028    CA
#> 92     R  015   XC    028    CA
#> 93     R  015   XC    028    CA
#> 94     R  015   XY    009    CA
#> 95     R  015   XY    009    CA
#> 96     R  015   XY    009    CA
#> 97     R  015   XY    009    CA
#> 98     R  015   XC    028    CA
#> 99     R  015   XC    028    CA
#> 100    R  015   XC    028    CA
#> 101 <NA> <NA> <NA>   <NA>  <NA>
#> 102    R  015   XY    003    CA
#> 103    R  015   XY    003    CA
#> 104    R  015   XY    003    CA
#> 105    R  015   XC    032    CA
#> 106    R  015   XC    032    CA
#> 107    R  015   XC    032    CA
#> 108    R  015   XY    009    CA
#> 109    R  015   XY    009    CA
#> 110 <NA> <NA> <NA>   <NA>  <NA>
#> 111 <NA> <NA> <NA>   <NA>  <NA>
#> 112    R  014   XC    007    CA

# check aggregate condition percentage
x$agg_pct_r <- es_calculate_aggregate_sitepct(x)
table(x$agg_pct_r)
#> 
#>  80  85  88  90  91  92  93  94  95  96  97  98  99 100 
#>   1   1   1   1   2   6   4   2   4   5  12   8  12  53

# inspect one mapunit with aggregate site percentage <100%
x[which(x$agg_pct_r == 80), ]
#>     mukey                                                    muname
#> 1: 459451 Rock outcrop-Xerorthents complex, 50 to 75 percent slopes
#>    nationalmusym        site1    site1name site1compname site1pct_r site1link
#> 1:          hf30 Not assigned Not assigned  Rock outcrop         50      <NA>
#>          site2                 site2name site2compname site2pct_r
#> 1: R015XY014CA Loamy Mountains 20-40"ppt   Xerorthents         30
#>                                                      site2link        site3
#> 1: https://edit.jornada.nmsu.edu/catalogs/esd/015X/R015XY014CA Not assigned
#>       site3name site3compname site3pct_r site3link agg_pct_r
#> 1: Not assigned          <NA>         NA      <NA>        80
```

## Spatial Check Example

*TODO*
