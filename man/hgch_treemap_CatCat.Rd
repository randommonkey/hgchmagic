% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hgch_treemap_CatCat.R
\name{hgch_treemap_CatCat}
\alias{hgch_treemap_CatCat}
\title{Treemap chart Cat Cat}
\usage{
hgch_treemap_CatCat(data, ...)
}
\arguments{
\item{data}{A data frame, data frame extension (e.g. a tibble), a
lazy data frame (e.g. from dbplyr or dtplyr), or fringe data (e.g from homodatum).}

\item{...}{Read \code{\link[dsvizopts]{chart_viz_options}} a general options summary to configure your hgchmagic plots
and <\code{\link[=hgch_treemap_options]{treemap-options}}> which specifically contains the additional arguments
that work only for this type of chart.}
}
\description{
\code{hgch_treemap_CatCat()} Create a highcharter treemap plot based on a particular data type.
In this case, you can load data with only two columns, where the firts and second columns are
\strong{categoricals columns}, or be sure that firts two columns they meet this condition, since it
will be done a counting the categories of this columns.
}
\section{Ftype}{

Cat-Cat
}

\examples{
data <- sample_data("Cat-Cat", n = 30)
hgch_treemap_CatCat(data)

# Activate data labels
hgch_treemap_CatCat(data,
                       dataLabels_show = TRUE)

# data with more of one column
data <- sample_data("Cat-Cat-Num-Yea-Cat", n = 30)
hgch_treemap_CatCat(data)

# Change variable to color and pallete type
hgch_treemap_CatCat(data,
                       color_by = names(data)[2],
                       palette_type = "sequential")

# Change tooltip info and add additional information contained in your data
names_data <- names(data)
info_tool <- paste0("<b>",names_data[1],":</b> {", names_data[1],"}<br/><b>", names_data[4],":</b> {", names_data[4],"}<br/>")
data \%>\%
 hgch_treemap_CatCat(tooltip = info_tool)

}
\seealso{
Other Cat-Cat plots: 
\code{\link{hgch_bar_CatCat}()},
\code{\link{hgch_bubbles_CatCat}()},
\code{\link{hgch_dumbbell_CatCat}()},
\code{\link{hgch_sankey_CatCat}()}
}
\concept{Cat-Cat plots}
