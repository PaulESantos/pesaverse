#' @keywords internal
"_PACKAGE"

# Suppress R CMD check note
#' @importFrom forcats fct_c
#' @importFrom ggplot2 ggplot
#' @importFrom hms hms
#' @importFrom lubridate ymd
#' @importFrom readr read_csv
#' @importFrom readxl read_excel
#' @importFrom stringr str_c
#' @importFrom tidyr spread
NULL


release_bullets <- function() {
  c(
    '`usethis::use_latest_dependencies(TRUE, "CRAN")`',
    '`pesaverse_dependency_dissuade()`'
  )
}
