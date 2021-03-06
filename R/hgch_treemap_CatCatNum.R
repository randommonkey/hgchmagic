#' Treemap chart Cat Cat Num
#'
#' @description
#' `hgch_treemap_CatCatNum()` Create a highcharter treemap plot based on a particular data type.
#' In this case, you can load data with only three columns, where the firts and second columns are
#' **categoricals columns** and the third must be  a **numeric class column**, or be sure that
#' three firts columns they meet this condition
#' @export
#' @inheritParams hgch_treemap_CatNum
#' @family Cat-Cat-Num plots
#' @section Ftype:
#' Cat-Cat-Num
#' @examples
#' data <- sample_data("Cat-Cat-Num", n = 30)
#' hgch_treemap_CatCatNum(data)
#'
#' # Activate data labels
#' hgch_treemap_CatCatNum(data,
#'                        dataLabels_show = TRUE)
#'
#' # if you want to calculate the average instead of the sum, you can use agg inside a function
#' hgch_treemap_CatCatNum(data,
#'                        agg = "mean",
#'                        dataLabels_show = TRUE)
#'
#' # data with more of one column
#' data <- sample_data("Cat-Cat-Num-Dat-Yea-Cat", n = 30)
#' hgch_treemap_CatCatNum(data)
#'
#' # Change variable to color and pallete type
#' hgch_treemap_CatCatNum(data,
#'                        color_by = names(data)[2],
#'                        palette_type = "sequential")
#'
#' # Change tooltip info and add additional information contained in your data
#' names_data <- names(data)
#' info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
#' data %>%
#'  hgch_treemap_CatCatNum(tooltip = info_tool)
#'
hgch_treemap_CatCatNum <- function(data, ...){
  if (is.null(data)) stop(" dataset to visualize")

  opts <- dsvizopts::merge_dsviz_options(...)

  l <- hgchmagic_prep(data, opts = opts, plot = "treemap", ftype = "Cat-Cat-Num")

  d <- l$d

  color_by <- "a"#l$color_by
  paleta <- d[,c(color_by, "..colors")]
  paleta <- paleta %>% dplyr::distinct(..colors, .keep_all = TRUE)

  listaId <- purrr::map(1:length(paleta[[color_by]]), function(i) {
    list(
      id = as.character(paleta[[color_by]][i]),
      name = as.character(paleta[[color_by]][i]),
      color = as.character(paleta$..colors[i])
    )
  })

  listaMg <- purrr::map(1:nrow(d), function(z) {
    nm <- ifelse(is.na(d$b[z]), "NA", d$b[z])
    list(
      name = nm,
      parent = d$a[z],
      value = d[[3]][z],
      label = d$labels[z],
      colorValue = d[[3]][z]
    )

  })

  data <- c(listaId, listaMg)

  global_options(opts$style$format_sample_num)
  hc <- highchart() %>%
    hc_title(text = l$title$title) %>%
    hc_subtitle(text = l$title$subtitle) %>%
    hc_chart(events = list(
               load = add_branding(l$theme)
             )) %>%
    hc_series(
      list(
        type = "treemap",
        layoutAlgorithm = l$extra$treemap_layout,
        levels = list(list(
          level = 1
        )),
        data = data
      )) %>%
     hc_tooltip(useHTML = TRUE,
                formatter = JS(paste0("function () {return this.point.label;}")),
                style = list(width = "300px", whiteSpace = "normal")) %>%
    hc_credits(enabled = TRUE, text = l$title$caption %||% "") %>%
  hc_add_theme(hgch_theme(opts =  c(l$theme,
                               cats = "{point.name} <br/>")))

  hc

}


#' Treemap chart Cat Yea Num
#'
#' @description
#' `hgch_treemap_CatYeaNum()` Create a highcharter treemap plot based on a particular data type.
#' In this case, you can load data with only three columns, where the firts column is a
#' **categorical column**, second is a **year column** and the third must be  a **numeric class column**,
#'  or be sure that three firts columns they meet this condition
#' @export
#' @inheritParams hgch_treemap_CatCatNum
#' @section Ftype:
#' Cat-Yea-Num
#' @examples
#' data <- sample_data("Cat-Yea-Num", n = 30)
#' hgch_treemap_CatYeaNum(data)
#'
#' # Activate data labels
#' hgch_treemap_CatYeaNum(data,
#'                        dataLabels_show = TRUE)
#'
#' # data with more of one column
#' data <- sample_data("Cat-Yea-Num-Dat-Yea-Cat", n = 30)
#' hgch_treemap_CatYeaNum(data)
#'
#' # Change variable to color and pallete type
#' hgch_treemap_CatYeaNum(data,
#'                        color_by = names(data)[2],
#'                        palette_type = "sequential")
#'
#' # Change tooltip info and add additional information contained in your data
#' names_data <- names(data)
#' info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
#' data %>%
#'  hgch_treemap_CatYeaNum(tooltip = info_tool)
#'
hgch_treemap_CatYeaNum <- hgch_treemap_CatCatNum


#' Treemap chart Yea Cat Num
#'
#' @description
#' `hgch_treemap_YeaCatNum()` Create a highcharter treemap plot based on a particular data type.
#' In this case, you can load data with only three columns, where the firts column is a
#' **year column**, second is a **categorical column** and the third must be  a **numeric class column**,
#'  or be sure that three firts columns they meet this condition
#' @export
#' @inheritParams hgch_treemap_CatNum
#' @family Yea-Cat-Num plots
#' @section Ftype:
#' Yea-Cat-Num
#' @examples
#' data <- sample_data("Yea-Cat-Num", n = 30)
#' hgch_treemap_YeaCatNum(data)
#'
#' # Activate data labels
#' hgch_treemap_YeaCatNum(data,
#'                        dataLabels_show = TRUE)
#'
#' # data with more of one column
#' data <- sample_data("Yea-Cat-Num-Dat-Yea-Cat", n = 30)
#' hgch_treemap_YeaCatNum(data)
#'
#' # Change variable to color and pallete type
#' hgch_treemap_YeaCatNum(data,
#'                        color_by = names(data)[2],
#'                        palette_type = "sequential")
#'
#' # Change tooltip info and add additional information contained in your data
#' names_data <- names(data)
#' info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
#' data %>%
#'  hgch_treemap_YeaCatNum(tooltip = info_tool)
#'
hgch_treemap_YeaCatNum <- hgch_treemap_CatCatNum

