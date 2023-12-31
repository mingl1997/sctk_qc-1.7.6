% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotDEAnalysis.R
\name{plotDEGRegression}
\alias{plotDEGRegression}
\title{plot the linear regression to show visualize the expression the of DEGs
identified by differential expression analysis}
\usage{
plotDEGRegression(
  inSCE,
  useResult,
  threshP = FALSE,
  labelBy = NULL,
  nrow = 6,
  ncol = 6,
  defaultTheme = TRUE,
  check_sanity = TRUE
)
}
\arguments{
\item{inSCE}{\linkS4class{SingleCellExperiment} inherited object.
\code{runMAST()} has to be run in advance.}

\item{useResult}{character. A string specifying the \code{analysisName}
used when running a differential expression analysis function.}

\item{threshP}{logical. Whether to plot threshold values from adaptive
thresholding, instead of using the assay used by \code{runMAST()}. Default
\code{FALSE}.}

\item{labelBy}{A single character for a column of \code{rowData(inSCE)} as
where to search for the labeling text. Default \code{NULL}.}

\item{nrow}{Integer. Number of rows in the plot grid. Default \code{6}.}

\item{ncol}{Integer. Number of columns in the plot grid. Default \code{6}.}

\item{defaultTheme}{Logical scalar. Whether to use default SCTK theme in
ggplot. Default \code{TRUE}.}

\item{check_sanity}{Logical scalar. Whether to perform MAST's sanity check
to see if the counts are logged. Default \code{TRUE}}
}
\value{
A ggplot object of linear regression
}
\description{
plot the linear regression to show visualize the expression the of DEGs
identified by differential expression analysis
}
