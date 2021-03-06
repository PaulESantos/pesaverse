
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pesaverse

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/pesaverse)](https://cran.r-project.org/package=pesaverse)
[![R-CMD-check](https://github.com/PaulESantos/pesaverse/workflows/R-CMD-check/badge.svg)](https://github.com/PaulESantos/pesaverse/actions)
<!-- badges: end -->

## Overview

The pesaverse is a set of packages that work in harmony because they
share common data representations and API design. The **pesaverse**
package is designed to make it easy to install and load core packages
from the pesaverse in a single command.

## Installation

``` r
# Install the development version from GitHub
# install.packages("remotes")
remotes::install_github("PaulESantos/pesaverse")
```

## Usage

`library(pesaverse)` will load the core pesaverse packages:

-   [ggplot2](https://ggplot2.tidyverse.org), for data visualisation.
-   [poorman](https://github.com/nathaneastwood/poorman), for data
    manipulation.
-   [tidyr](https://pesar.tidyverse.org), for data pesaing.
-   [readr](https://readr.tidyverse.org), for data import.
-   [purrr](https://purrr.tidyverse.org), for functional programming.
-   [tibble](https://tibble.tidyverse.org), for tibbles, a modern
    re-imagining of data frames.
-   [stringr](https://github.com/pesaverse/stringr), for strings.
-   [forcats](https://github.com/pesaverse/forcats), for factors.

You also get a condensed summary of conflicts with other packages you
have loaded:

``` r
library(pesaverse)
```

You can see conflicts created later with `pesaverse_conflicts()`:

``` r
library(MASS)
pesaverse_conflicts()
```

And you can check that all pesaverse packages are up-to-date with
`pesaverse_update()`:

``` r
pesaverse_update()
#> The following packages are out of date:
#>  * broom (0.4.0 -> 0.4.1)
#>  * DBI   (0.4.1 -> 0.5)
#>  * Rcpp  (0.12.6 -> 0.12.7)
#> Update now?
#> 
#> 1: Yes
#> 2: No
```

## Packages

As well as the core pesaverse, installing this package also installs a
selection of other packages that you???re likely to use frequently, but
probably not in every analysis. This includes packages for:

-   Working with specific types of vectors:

    -   [hms](https://github.com/pesaverse/hms), for times.
    -   [lubridate](https://github.com/pesaverse/lubridate), for
        date/times.

-   Importing other types of data:

    -   [readxl](https://github.com/pesaverse/readxl), for `.xls` and
        `.xlsx` files.
