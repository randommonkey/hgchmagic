% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hgch_treemap_Cat.R
\name{hgch_treemap_Cat}
\alias{hgch_treemap_Cat}
\title{Treemap chart Cat}
\usage{
hgch_treemap_Cat(data, ...)
}
\arguments{
\item{data}{A data frame, data frame extension (e.g. a tibble), a
lazy data frame (e.g. from dbplyr or dtplyr), or fringe data (e.g from homodatum).}

\item{...}{Read \code{\link[dsvizopts]{chart_viz_options}} a general options summary to configure your hgchmagic plots
and <\code{\link[=hgch_treemap_options]{treemap-options}}> which specifically contains the additional arguments
that work only for this type of chart.}
}
\description{
\code{hgch_treemap_Cat()} Create a highcharter treemap plot based on a particular data type.
In this case, you can load data with only one \strong{categorical column} or be sure of
the first column of the dataframe its categorical, since it will be done a
counting the categories of this column.
}
\section{Ftype}{

Cat
}

\examples{
data <- sample_data("Cat", n = 30)
hgch_treemap_Cat(data)

# data with more of one column
data <- sample_data("Cat-Num-Dat-Cat-Cat", n = 30)
hgch_treemap_Cat(data)

# calculate percentage
hgch_treemap_Cat(data, percentage = TRUE)

# You can call the count and percentage in the tooltip plot
data \%>\%
hgch_treemap_Cat(tooltip = "Count: {Count} <br/> Percentage: {\%}\%")

}
\seealso{
Other Cat plots: 
\code{\link{hgch_bar_Cat}()},
\code{\link{hgch_bubbles_Cat}()},
\code{\link{hgch_donut_Cat}()},
\code{\link{hgch_pie_Cat}()}
}
\concept{Cat plots}
