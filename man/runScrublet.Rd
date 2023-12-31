% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scrublet_doubletDetection.R
\name{runScrublet}
\alias{runScrublet}
\title{Find doublets using \code{scrublet}.}
\usage{
runScrublet(
  inSCE,
  sample = NULL,
  useAssay = "counts",
  simDoubletRatio = 2,
  nNeighbors = NULL,
  minDist = NULL,
  expectedDoubletRate = 0.1,
  stdevDoubletRate = 0.02,
  syntheticDoubletUmiSubsampling = 1,
  useApproxNeighbors = TRUE,
  distanceMetric = "euclidean",
  getDoubletNeighborParents = FALSE,
  minCounts = 3,
  minCells = 3L,
  minGeneVariabilityPctl = 85,
  logTransform = FALSE,
  meanCenter = TRUE,
  normalizeVariance = TRUE,
  nPrinComps = 30L,
  tsneAngle = NULL,
  tsnePerplexity = NULL,
  verbose = TRUE,
  seed = 12345
)
}
\arguments{
\item{inSCE}{A \link[SingleCellExperiment]{SingleCellExperiment} object.
Needs \code{counts} in assays slot.}

\item{sample}{Character vector. Indicates which sample each cell belongs to.
Scrublet will be run on cells from each sample separately. If NULL, then
all cells will be processed together. Default \code{NULL}.}

\item{useAssay}{A string specifying which assay in the SCE to use. Default
'counts'.}

\item{simDoubletRatio}{Numeric. Number of doublets to simulate relative to
the number of observed transcriptomes. Default 2.0.}

\item{nNeighbors}{Integer. Number of neighbors used to construct the KNN
graph of observed transcriptomes and simulated doublets. If \code{NULL},
this is set to \code{round(0.5 * sqrt(n_cells))}. Default \code{NULL}.}

\item{minDist}{Float Determines how tightly UMAP packs points together. If \code{NULL},
this is set to 0.1. Default \code{NULL}.}

\item{expectedDoubletRate}{The estimated doublet rate for the experiment.
Default 0.1.}

\item{stdevDoubletRate}{Uncertainty in the expected doublet rate.
Default 0.02.}

\item{syntheticDoubletUmiSubsampling}{Numeric. Rate for sampling UMIs
when creating synthetic doublets. If 1.0, each doublet is created by simply
adding the UMIs from two randomly sampled observed transcriptomes. For
values less than 1, the UMI counts are added and then randomly sampled at
the specified rate. Defuault: 1.0.}

\item{useApproxNeighbors}{Boolean. Use approximate nearest neighbor method
(\code{annoy}) for the KNN classifier. Default \code{TRUE}.}

\item{distanceMetric}{Character. Distance metric used when finding nearest
neighbors.
For list of valid values, see the documentation for \code{annoy} (if
\code{useApproxNeighbors} is \code{TRUE}) or
\code{sklearn.neighbors.NearestNeighbors} (if \code{useApproxNeighbors} is
\code{FALSE}). Default "euclidean".}

\item{getDoubletNeighborParents}{Boolean. If \code{TRUE}, return the
parent transcriptomes that generated the doublet neighbors of each
observed transcriptome. This information can be used to infer the cell
states that generated a given doublet state. Default \code{FALSE}.}

\item{minCounts}{Numeric. Used for gene filtering prior to PCA. Genes
expressed at fewer than \code{minCounts} in fewer than \code{minCells}
(see below) are excluded. Default 3.}

\item{minCells}{Integer. Used for gene filtering prior to PCA. Genes
expressed at fewer than \code{minCounts} (see above) in fewer than
\code{minCells} are excluded. Default 3.}

\item{minGeneVariabilityPctl}{Numeric. Used for gene filtering prior to
PCA. Keep the most highly variable genes (in the top
minGeneVariabilityPctl percentile), as measured by the v-statistic
(\emph{Klein et al., Cell 2015}). Default 85.}

\item{logTransform}{Boolean. If \code{TRUE}, log-transform the counts matrix
(log10(1+TPM)). \code{sklearn.decomposition.TruncatedSVD} will be used for
dimensionality reduction, unless \code{meanCenter} is \code{TRUE}.
Default \code{FALSE}.}

\item{meanCenter}{If \code{TRUE}, center the data such that each gene has a
mean of 0. \code{sklearn.decomposition.PCA} will be used for
dimensionality reduction. Default \code{TRUE}.}

\item{normalizeVariance}{Boolean. If \code{TRUE}, normalize the data such
that each gene has a variance of 1.
\code{sklearn.decomposition.TruncatedSVD} will be used for dimensionality
reduction, unless \code{meanCenter} is \code{TRUE}. Default \code{TRUE}.}

\item{nPrinComps}{Integer. Number of principal components used to embed
the transcriptomes prior to k-nearest-neighbor graph construction.
Default 30.}

\item{tsneAngle}{Float. Determines angular size of a distant node as measured
from a point in the t-SNE plot. If default, it is set to 0.5 Default \code{NULL}.}

\item{tsnePerplexity}{Integer. The number of nearest neighbors that
is used in other manifold learning algorithms.
If default, it is set to 30. Default \code{NULL}.}

\item{verbose}{Boolean. If \code{TRUE}, print progress updates. Default
\code{TRUE}.}

\item{seed}{Seed for the random number generator. Default 12345.}
}
\value{
A \link[SingleCellExperiment]{SingleCellExperiment} object with
 \code{scrub_doublets} output appended to the
 \link[SummarizedExperiment]{colData} slot. The columns include
 \emph{scrublet_score} and \emph{scrublet_call}.
}
\description{
A wrapper function that calls \code{scrub_doublets} from python
 module \code{scrublet}. Simulates doublets from the observed data and uses
 a k-nearest-neighbor classifier to calculate a continuous
 \code{scrublet_score} (between 0 and 1) for each transcriptome. The score
 is automatically thresholded to generate \code{scrublet_call}, a boolean
 array that is \code{TRUE} for predicted doublets and \code{FALSE}
 otherwise.
}
\examples{
data(scExample, package = "singleCellTK")
sce <- subsetSCECols(sce, colData = "type != 'EmptyDroplet'")
sce <- runScrublet(sce)
}
