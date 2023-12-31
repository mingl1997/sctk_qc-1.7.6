% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seuratFunctions.R
\name{.updateAssaySCE}
\alias{.updateAssaySCE}
\title{.updateAssaySCE
Update/Modify/Add an assay in the provided SingleCellExperiment object from a Seurat object}
\usage{
.updateAssaySCE(
  inSCE,
  seuratObject,
  assaySlotSCE,
  seuratDataSlot = "counts",
  seuratAssaySlot = "RNA"
)
}
\arguments{
\item{inSCE}{Input SingleCellExperiment object}

\item{seuratObject}{Input Seurat object}

\item{assaySlotSCE}{Selected assay to update in the input SingleCellExperiment object}

\item{seuratDataSlot}{Selected data slot from the Seurat object. Default \code{"counts"}.}

\item{seuratAssaySlot}{Selected assay from Seurat object. Default \code{"RNA"}.}
}
\value{
A \link[SingleCellExperiment]{SingleCellExperiment} object with
 data from Seurat object appended to the \link[SummarizedExperiment]{assay} slot.
}
\description{
.updateAssaySCE
Update/Modify/Add an assay in the provided SingleCellExperiment object from a Seurat object
}
