% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importAnnData.R
\name{importAnnData}
\alias{importAnnData}
\title{Create a SingleCellExperiment Object from Python AnnData .h5ad files}
\usage{
importAnnData(sampleDirs = NULL, sampleNames = NULL, delayedArray = TRUE)
}
\arguments{
\item{sampleDirs}{Folder containing the .h5ad file. Can be one of -
\itemize{
  \item Default \code{current working directory}.
  \item Full path to the directory containing the .h5ad file.
  E.g \code{sampleDirs = '/path/to/sample'}
  \item A vector of folder paths for the samples to import.
  E.g. \code{sampleDirs = c('/path/to/sample1', '/path/to/sample2','/path/to/sample3')}
  importAnnData will return a single SCE object containing all the samples
  with the sample name appended to each colname in colData
}}

\item{sampleNames}{The prefix/name of the .h5ad file without the .h5ad extension
e.g. if 'sample.h5ad' is the filename, pass \code{sampleNames = 'sample'}.
Can be one of -
\itemize{
  \item Default \code{sample}.
  \item A vector of samples to import. Length of vector must be equal to length of sampleDirs vector
  E.g. \code{sampleDirs = c('sample1', 'sample2','sample3')}
  importAnnData will return a single SCE object containing all the samples
  with the sample name appended to each colname in colData
}}

\item{delayedArray}{Boolean. Whether to read the expression matrix as
\link[DelayedArray]{DelayedArray} object. Default \code{TRUE}.}
}
\value{
A \code{SingleCellExperiment} object.
}
\description{
This function reads in one or more Python AnnData files in the .h5ad format
and returns a single \link[SingleCellExperiment]{SingleCellExperiment} object containing all the
AnnData samples by concatenating their counts matrices and related information slots.
}
\details{
\code{importAnnData} converts scRNA-seq data in the AnnData format to the
\code{SingleCellExperiment} object. The .X slot in AnnData is transposed to the features x cells
format and becomes the 'counts' matrix in the assay slot. The .vars AnnData slot becomes the SCE rowData
and the .obs AnnData slot becomes the SCE colData. Multidimensional data in the .obsm AnnData slot is
ported over to the SCE reducedDims slot. Additionally, unstructured data in the .uns AnnData slot is
available through the SCE metadata slot.
There are 2 currently known minor issues -
Anndata python module depends on another python module h5pyto read hd5 format files.
If there are errors reading the .h5ad files, such as "ValueError: invalid shape in fixed-type tuple."
the user will need to do downgrade h5py by running \code{pip3 install --user h5py==2.9.0}
Additionally there might be errors in converting some python objects in the unstructured data slots.
There are no known R solutions at present. Refer \url{https://github.com/rstudio/reticulate/issues/209}
}
\examples{
file.path <- system.file("extdata/annData_pbmc_3k", package = "singleCellTK")
\dontrun{
sce <- importAnnData(sampleDirs = file.path,
                     sampleNames = 'pbmc3k_20by20')
}
}
