% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createRACS_flex.R
\name{createRACS}
\alias{createRACS}
\title{Create a Restricted Adaptive Cluster Sample, for any step size}
\usage{
createRACS(
  popdata,
  n1,
  yvar,
  condition = 0,
  seed = NA,
  initsample = NULL,
  f_max = 2
)
}
\arguments{
\item{popdata}{grid of population to be sampled.}

\item{n1}{initial sample size (sampled according to simple random sampling without replacement).}

\item{yvar}{Variable of interest, y, used to determine condition under which adaptive cluster sampling takes place. Must be numeric. ACSampling is triggered when 'yvar' is greater than the condition.}

\item{condition}{Threshold value of the 'y' variable that initiates Restricted ACS. Defaults to \code{0}. Must be numeric.}

\item{seed}{vector of numbers to feed to \code{set.seed()} so that the sampling is reproducible.}

\item{initsample}{List of x and y coordinates of the initial sample. Defaults to "NA" so that the initial sample is selected according to simple random sampling without replacement.}

\item{f_max}{WHAT IS IT}
}
\value{
A restricted adaptive cluster sample.
}
\description{
Create a Restricted Adaptive Cluster Sample, for any step size
}
\examples{
library(ggplot2)
popdata = lambdap_5_tau_1
seed=3
n1=5
yvar = "y_value"
f_max = 3
Z = createRACS(
	popdata = lambdap_5_tau_1, 
	n1 = n1, 
	yvar = yvar, 
	seed = seed, 
	f_max = f_max
)
ggplot() +
geom_point(
data=Z, 
aes(x,y, size=factor(y_value), shape=factor(y_value))
) +
scale_shape_manual(values=c(1, rep(16, length(2:13)))) +
geom_point(data=Z, aes(x,y), shape = 0, size=7) +
ggtitle("f_max = 1")
}
\references{
Sauby, K.E and Christman, M.C. \emph{In preparation.} A Sampling Strategy Designed to Maximize the Efficiency of Data Collection of Food Web Relationships.
}
