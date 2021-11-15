#' @keywords internal
"_PACKAGE"

# Suppress R CMD check note
#' @importFrom forcats fct_c
#' @importFrom ggplot2 ggplot
#' @importFrom hms hms
#' @importFrom lubridate ymd
#' @importFrom modelr add_predictions
#' @importFrom readr read_csv
#' @importFrom readxl read_excel
#' @importFrom rlang qq_show
#' @importFrom rvest html_node
#' @importFrom stringr str_c
#' @importFrom tidyr spread
#' @importFrom xml2 read_xml
NULL


release_bullets <- function() {
  c(
    '`usethis::use_latest_dependencies(TRUE, "CRAN")`',
    '`pesaverse_dependency_dissuade()`'
  )
}
