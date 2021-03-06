% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pi_i_replace.R
\name{pi_i_replace}
\alias{pi_i_replace}
\title{Calculate the inclusion probability of unit $i$ in a simple random sample with replacement.}
\usage{
pi_i_replace(N, n1, m)
}
\arguments{
\item{N}{Population size.}

\item{n1}{Initial sample size.}

\item{m}{Vector of values giving the number of units satisfying the ACS criterion in netwalpha_star_iork $i$.}
}
\value{
vector of inclusion probabilities
}
\description{
Calculate the inclusion probability of unit $i$ in a simple random sample with replacement.
}
\references{
Sauby, K.E and Christman, M.C. \emph{In preparation.} Restricted adaptive cluster sampling.
}
