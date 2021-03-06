% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hgch_bubbles_CatCatNum.R
\name{hgch_bubbles_YeaCatNum}
\alias{hgch_bubbles_YeaCatNum}
\title{Bubbles chart Yea Cat Num}
\usage{
hgch_bubbles_YeaCatNum(data, ...)
}
\arguments{
\item{data}{A data frame, data frame extension (e.g. a tibble), a
lazy data frame (e.g. from dbplyr or dtplyr), or fringe data (e.g from homodatum).}

\item{...}{Read \code{\link[dsvizopts]{chart_viz_options}} a general options summary to configure your hgchmagic plots
and <\code{\link[=hgch_bubbles_options]{bubbles-options}}> which specifically contains the additional arguments
that work only for this type of chart.}
}
\description{
\code{hgch_bubbles_YeaCatNum()} Create a highcharter bubbles plot based on a particular data type.
In this case, you can load data with only three columns, where the firts column is a
\strong{year column}, second is a \strong{categorical column} and the third must be  a \strong{numeric class column},
or be sure that three firts columns they meet this condition
}
\section{Ftype}{

Yea-Cat-Num
}

\examples{
data <- sample_data("Yea-Cat-Num", n = 30)
hgch_bubbles_YeaCatNum(data)

# Activate data labels
hgch_bubbles_YeaCatNum(data,
                       dataLabels_show = TRUE)

# data with more of one column
data <- sample_data("Yea-Cat-Num-Dat-Yea-Cat", n = 30)
hgch_bubbles_YeaCatNum(data)

# Change variable to color and pallete type
hgch_bubbles_YeaCatNum(data,
                       color_by = names(data)[2],
                       palette_type = "sequential")

# Change tooltip info and add additional information contained in your data
names_data <- names(data)
info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
data \%>\%
 hgch_bubbles_YeaCatNum(tooltip = info_tool)

}
\seealso{
Other Yea-Cat-Num plots: 
\code{\link{hgch_area_YeaCatNum}()},
\code{\link{hgch_bar_YeaCatNum}()},
\code{\link{hgch_line_YeaCatNum}()},
\code{\link{hgch_treemap_YeaCatNum}()}
}
\concept{Yea-Cat-Num plots}
