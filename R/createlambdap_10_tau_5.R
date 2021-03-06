#' Create the population, \deqn{\lambda_P = 10, \tau = 5}{lambda_P = 10, tau = 5}, from Christman (1997)
#' 
#' @return The population displayed in Christman (1997), where \deqn{\lambda_P = 10, \tau = 5}{lambda_P = 10, tau = 5}.
#' @noRd

createlambdap_10_tau_5 <- function() {
	lambdap_10_tau_5 <- expand.grid(
		x = 1:10,
		y = 1:10
	) %>%
		cbind(
			y_value = c(
				0,0,0,1,14,23,0,0,14,37,
				rep(0,5),4,0,0,0,5,
				rep(0,8),1,1,
				rep(0,8),3,7,
				8,4,0,6,2,2,1,0,23,27,
				17,20,3,12,22,4,0,2,8,42,
				3,2,1,4,12,1,3,23,20,5,
				rep(0,5),14,19,26,35,7,
				14,3,0,0,8,25,29,17,26,10,
				36,6,1,0,4,4,35,39,8,5
			)
		)
	lambdap_10_tau_5_networks <- assignNetworkMembership(
		lambdap_10_tau_5 %>% filter(.data$y_value > 0), 
		plot.size=1
	)
	# fill in m values
	lambdap_10_tau_5 %<>% merge(lambdap_10_tau_5_networks, all=T)
	lambdap_10_tau_5[which(lambdap_10_tau_5$y_value==0), ]$m <- 1
	# fill in NetworkIDs
	maxID <- max(lambdap_10_tau_5$NetworkID, na.rm=T)
	lambdap_10_tau_5[which(is.na(lambdap_10_tau_5$NetworkID)), ]$NetworkID <- seq(from=(maxID + 1), 
		to=(maxID + length(which(is.na(lambdap_10_tau_5$NetworkID)))), by=1)
	return(lambdap_10_tau_5)
}