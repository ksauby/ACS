#' Calculate the variance of the Horvitz-Thompson estimator of the mean
#' @param N Population size
#' @param n1 Initial sample size
#' @param m Vector of $m$, each corresponding to a unique network.
#' @param y Vector of $y$ total, each corresponding to a unique network.
#' @references Sauby, K.E and Christman, M.C. \emph{In preparation.} Restricted adaptive cluster sampling.
#'
#' Thompson, S. (1990). Adaptive Cluster Sampling. \emph{Journal of the American Statistical Association}, 85(412): 1050--1059.
#' @examples 
# Sampling of population from Figure 1, Thompson (1990)
#'
#' data(Thompson1990Fig1Pop)
#' data(Thompson1990Figure1Sample)
#' 
#' # plot sample overlaid onto population
#' ggplot() +
#' 	geom_point(data=Thompson1990Fig1Pop, aes(x,y, size=factor(y_value),
#' 		shape=factor(y_value))) +
#' 	scale_shape_manual(values=c(1, rep(16, length(2:13)))) +
#' 	geom_point(data=Thompson1990Figure1Sample, aes(x,y), shape=0, size=7)
#' 
#' # INITIATE ACS
#' Z = createACS(population=Thompson1990Fig1Pop, n1=dim(Thompson1990Figure1Sample)[1], initial_sample=Thompson1990Figure1Sample, y_variable="y_value")
#' 
#' # CALCULATE var(t_HT)
#' # create dataframe of network info
#' Z_summary <- Z %>% group_by(NetworkID) %>%
#' 	summarise(
#' 		m = m[1],
#' 		y_total = sum(y_value, rm.na=T)
#' 		) %>%
#' 		filter(NetworkID > 0)
#' 
#' var_t_HT(
#' 	N = dim(Thompson1990Fig1Pop)[1], 
#' 	n1 = dim(Thompson1990Figure1Sample)[1], 
#' 	m = Z_summary$m, 
#' 	y = Z_summary$y_total
#' )
#' @export

var_t_HT_ <- function(N, n1, m, y, pi_i_values) {
	pi_jh_values 		<- pi_jh(N, n1, m) %>% as.matrix
	# replace diagonal (where h = j)
	diag(pi_jh_values) 	<- pi_i_values	
	# dataframe to store sum(k=1 to kappa) sum(m=1 to kappa)
	V = as.data.frame(matrix(nrow=length(m), ncol=length(m), NA))
	# calculate for all pairs
	for (j in 1:length(m)) {
		V[j, ] = 	y[j] * y * 
					(pi_jh_values[j, ] - pi_i_values[j] * pi_i_values) / 
					(pi_i_values[j] * pi_i_values * pi_jh_values[j, ])
	}
	sum(V, na.rm=T)/(N^2)
}