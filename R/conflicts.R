#' Conflicts between the pesaverse and other packages
#'
#' This function lists all the conflicts between packages in the pesaverse
#' and other packages that you have loaded.
#'
#'
#' @export
#' @examples
#' pesaverse_conflicts()
pesaverse_conflicts <- function() {
  envs <- grep("^package:", search(), value = TRUE)
  envs <- purrr::set_names(envs)
  objs <- invert(lapply(envs, ls_env))

  conflicts <- purrr::keep(objs, ~ length(.x) > 1)

  tidy_names <- paste0("package:", pesaverse_packages())
  conflicts <- purrr::keep(conflicts, ~ any(.x %in% tidy_names))

  conflict_funs <- purrr::imap(conflicts, confirm_conflict)
  conflict_funs <- purrr::compact(conflict_funs)

  structure(conflict_funs, class = "pesaverse_conflicts")
}

pesaverse_conflict_message <- function(x) {
  if (length(x) == 0) return("")

  header <- cli::rule(
    left = crayon::bold("Conflicts"),
    right = "pesaverse_conflicts()"
  )

  pkgs <- x |>  purrr::map(~ gsub("^package:", "", .))
  others <- pkgs |> purrr::map(`[`, -1)
  other_calls <- purrr::map2_chr(
    others, names(others),
    ~ paste0(crayon::blue(.x), "::", .y, "()", collapse = ", ")
  )

  winner <- pkgs |> purrr::map_chr(1)
  funs <- format(paste0(crayon::blue(winner), "::", crayon::green(paste0(names(x), "()"))))
  bullets <- paste0(
    crayon::red(cli::symbol$cross), " ", funs,
    " masks ", other_calls,
    collapse = "\n"
  )

  paste0(header, "\n", bullets)
}

#' @export
print.pesaverse_conflicts <- function(x, ..., startup = FALSE) {
  cli::cat_line(pesaverse_conflict_message(x))
}

confirm_conflict <- function(packages, name) {
  # Only look at functions
  objs <- packages |>
    purrr::map(~ get(name, pos = .)) |>
    purrr::keep(is.function)

  if (length(objs) <= 1)
    return()

  # Remove identical functions
  objs <- objs[!duplicated(objs)]
  packages <- packages[!duplicated(packages)]
  if (length(objs) == 1)
    return()

  packages
}

ls_env <- function(env) {
  x <- ls(pos = env)
  x <- x[x != "%>%"]
  if (identical(env, "package:poorman")) {
    x <- setdiff(x, c("column_to_rownames", "contains",
                      "ends_with", "everything", "glimpse",
                      "has_rownames", "last_col", "num_range",
                      "remove_rownames", "replace_na", "rowid_to_column",
                      "rownames_to_column", "starts_with", "unite"))
  }
  else if(identical(env, "package:base")){
    x <- setdiff(x, c("system.file", "library.dynam.unload"))
  }
  else if(identical(env, "package:tidyr")){
    x <- setdiff(x, c("matches", "ends_with"))
  }
  else if(identical(env, "package:janitor")){
    x <- setdiff(x, c("chisq.test", "fisher.test"))
  }
  else if(identical(env, "package:stats")){
    x <- setdiff(x, c("lag", "filter"))
  }
  x
}
