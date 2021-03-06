% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hgch_area_CatDatNum.R
\name{hgch_area_CatDatNum}
\alias{hgch_area_CatDatNum}
\title{Area chart Cat Dat Num}
\usage{
hgch_area_CatDatNum(data, ...)
}
\arguments{
\item{data}{A data frame, data frame extension (e.g. a tibble), a
lazy data frame (e.g. from dbplyr or dtplyr), or fringe data (e.g from homodatum).}

\item{...}{Read \code{\link[dsvizopts]{chart_viz_options}} a general options summary to configure your hgchmagic plots.}
}
\description{
\code{hgch_area_CatDatNum()} Create a highcharter area plot based on a particular data type.
In this case, you can load data with only three columns, where the firts column is a
\strong{categorical column}, second is a \strong{date column} and the third must be a \strong{numeric class column},
or be sure that three firts columns they meet this condition.
}
\section{Ftype}{

Cat-Dat-Num
}

\examples{
data <- sample_data("Cat-Dat-Num", n = 30)
hgch_area_CatDatNum(data)

# Activate data labels
hgch_area_CatDatNum(data,
                    dataLabels_show = TRUE)

# data with more of one column
data <- sample_data("Cat-Dat-Num-Num-Num-Cat", n = 30)
hgch_area_CatDatNum(data)

# Change variable to color and pallete type
hgch_area_CatDatNum(data,
                       color_by = names(data)[2],
                       palette_type = "sequential")

# Change tooltip info and add additional information contained in your data
names_data <- names(data)
info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
data \%>\%
 hgch_area_CatDatNum(tooltip = info_tool)

}
\seealso{
Other Cat-Dat-Num plots: 
\code{\link{hgch_line_CatDatNum}()},
\code{\link{hgch_scatter_CatDatNum}()}
}
\concept{Cat-Dat-Num plots}
