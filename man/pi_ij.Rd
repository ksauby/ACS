% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pi_ij_C.R
\name{pi_ij}
\alias{pi_ij}
\title{Calculate joint inclusion probability of unit $j$ and $h$}
\usage{
pi_ij(N, n1, m)
}
\arguments{
\item{N}{Population size.}

\item{n1}{Initial sample size.}

\item{m}{Vector of values giving the number of units satisfying the ACS criterion in network $i$.}
}
\description{
Calculate joint inclusion probability of unit $j$ and $h$
}
\examples{
# Thompson sampling book, ch. 24 exercises, p. 307, number 2
library(magrittr)
N=1000
n1=100
m=c(2,3,rep(1,98))
pi_ij(N, n1, m) \%>\% .[1,2]
}
\references{
Sauby, K.E and Christman, M.C. \emph{In preparation.} Restricted adaptive cluster sampling.
}
