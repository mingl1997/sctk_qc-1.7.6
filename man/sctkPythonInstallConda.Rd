% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reticulate_setup.R
\name{sctkPythonInstallConda}
\alias{sctkPythonInstallConda}
\title{Installs Python packages into a Conda environment}
\usage{
sctkPythonInstallConda(
  envname = "sctk-reticulate",
  conda = "auto",
  packages = c("scipy", "numpy", "astroid", "six"),
  pipPackages = c("scrublet", "scanpy", "bbknn", "scanorama", "anndata"),
  selectConda = TRUE,
  forge = FALSE,
  pipIgnoreInstalled = TRUE,
  pythonVersion = NULL,
  ...
)
}
\arguments{
\item{envname}{Character. Name of the conda environment to create.}

\item{conda}{Character. Path to conda executable. Usue "auto" to find conda using the PATH and other conventional install locations. Default 'auto'.}

\item{packages}{Character Vector. List of packages to install from Conda.}

\item{pipPackages}{Character Vector. List of packages to install into the Conda environment using 'pip'.}

\item{selectConda}{Boolean. Run \code{\link[singleCellTK]{selectSCTKConda}} after installing all packages to select the Conda environment. Default TRUE.}

\item{forge}{Boolean. Include the Conda Forge repository.}

\item{pipIgnoreInstalled}{Boolean. Ignore installed versions when using pip. This is TRUE by default so that specific package versions can be installed even if they are downgrades.
The FALSE option is useful for situations where you don't want a pip install to attempt an overwrite of a conda binary package (e.g. SciPy on Windows which is very difficult
to install via pip due to compilation requirements).}

\item{pythonVersion}{Passed to \code{python_version} variable in \code{\link[reticulate]{conda_install}}. Default NULL.}

\item{...}{Other parameters to pass to \code{\link[reticulate]{conda_install}}.}
}
\value{
None. Installation of Conda environment.
}
\description{
Install all Python packages used in the \code{\link{singleCellTK}} package
using \code{\link[reticulate]{conda_install}} from package \code{\link{reticulate}}. This
will create a new Conda environment with the name \code{envname} if not already present.
Note that Anaconda or Miniconda already need to be installed on the local system.
}
\examples{
\dontrun{
sctkPythonInstallConda(envname = "sctk-reticulate")
}
}
\seealso{
See \code{\link[reticulate]{conda_create}} for more information on creating a Conda environment.
See \code{\link[reticulate]{conda_install}} for more description of the installation parameters.
See \url{https://rstudio.github.io/reticulate/} for more information on package \code{\link{reticulate}}.
See \code{\link[singleCellTK]{selectSCTKConda}} for reloading the Conda environment if R is restarted without
going through the whole installation process again.
See \url{https://docs.conda.io/en/latest/} for more information on Conda environments.
}
