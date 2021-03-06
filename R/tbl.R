# Generated by fusen: do not edit by hand

#' Table function to create named variable summary list
#'
#' @param df Dataframe
#' 
#' @param vars Variable Selection (tidyselect)
#'
#' @return
#' Named list of variable counts and percentages
#' @export
#'
#' @examples
#' datafile <- system.file("penguins.RDS", package = "varSummary")
#' penguins <- readRDS(datafile)
#' 
#' 
#' tbl(penguins, starts_with("bill"))
#' 
#' tbl(penguins, ends_with("_mm"))
#' 
#' tbl(penguins, c(island, sex, species))
tbl <- function(df, vars) {
  
  expression <- rlang::enquo(vars)
  col_names <- tidyselect::eval_select(expression, data = df) |>
    names()
  col_names |>
    purrr::map(~janitor::tabyl(df, !!rlang::sym(.x)) |> 
                 dplyr::arrange(dplyr::desc(n)) |> 
                 dplyr::mutate(cum_percent = cumsum(percent)) |> 
                 tibble::as_tibble()) |>
    rlang::set_names(col_names)
}
