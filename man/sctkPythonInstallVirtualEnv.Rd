% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reticulate_setup.R
\name{sctkPythonInstallVirtualEnv}
\alias{sctkPythonInstallVirtualEnv}
\title{Installs Python packages into a virtual environment}
\usage{
sctkPythonInstallVirtualEnv(
  envname = "sctk-reticulate",
  packages = c("scipy", "numpy", "astroid", "six", "scrublet", "scanpy", "scanorama",
    "bbknn", "anndata"),
  selectEnvironment = TRUE,
  python = NULL
)
}
\arguments{
\item{envname}{Character. Name of the virtual environment to create.}

\item{packages}{Character Vector. List of packages to install.}

\item{selectEnvironment}{Boolean. Run \code{\link[singleCellTK]{selectSCTKVirtualEnvironment}} after installing all packages to select the virtual environment. Default TRUE.}

\item{python}{The path to a Python interpreter, to be used with the created virtual environment. When NULL, the Python interpreter associated with the current session will be used. Default NULL.}
}
\value{
None. Installation of virtual environment.
}
\description{
Install all Python packages used in the \code{\link{singleCellTK}} package
using \code{\link[reticulate]{virtualenv_install}} from package \code{\link{reticulate}}. This
will create a new virtual environment with the name \code{envname} if not already present.
}
\examples{
\dontrun{
sctkPythonInstallVirtualEnv(envname = "sctk-reticulate")
}
}
\seealso{
See \code{\link[reticulate]{virtualenv_create}} for more information on creating a Conda environment.
See \code{\link[reticulate]{virtualenv_install}} for more description of the installation parameters.
See \url{https://rstudio.github.io/reticulate/} for more information on package \code{\link{reticulate}}.
See \code{\link[singleCellTK]{selectSCTKVirtualEnvironment}} for reloading the virtual environment if R is restarted without
going through the whole installation process again.
}
