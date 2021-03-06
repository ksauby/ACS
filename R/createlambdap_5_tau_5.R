#' Create the population, \deqn{\lambda_P = 5, \tau = 5}{lambda_P = 5, tau = 5}, from Christman (1997)
#' 
#' @return The population displayed in Christman (1997), where \deqn{\lambda_P = 5, \tau = 5}{lambda_P = 5, tau = 5}.
#' @noRd

createlambdap_5_tau_5 <- function() {
	lambdap_5_tau_5 <- expand.grid(
		x = 1:10,
		y = 1:10
	) %>%
		cbind(
			y_value = c(
				0,2,1,0,0,1,9,0,0,0,
				0,20,13,1,1,2,24,4,1,13,
				1,7,7,1,0,4,20,4,7,26,
				rep(0,5),5,14,2,2,0,
				rep(0,6),3,0,0,0,
				rep(0,10),
				rep(0,10),
				rep(0,10),
				rep(0,4),2,5,1,0,0,0,
				rep(0,4),16,20,rep(0,4)
			)
		)
	lambdap_5_tau_5_networks <- assignNetworkMembership(
		lambdap_5_tau_5 %>% filter(.data$y_value > 0), 
		plot.size=1
	)
	# fill in m values
	lambdap_5_tau_5 %<>% merge(lambdap_5_tau_5_networks, all=T)
	lambdap_5_tau_5[which(lambdap_5_tau_5$y_value==0), ]$m <- 1
	# fill in NetworkIDs
	maxID <- max(lambdap_5_tau_5$NetworkID, na.rm=T)
	lambdap_5_tau_5[which(is.na(lambdap_5_tau_5$NetworkID)), ]$NetworkID <- seq(from=(maxID + 1), 
		to=(maxID + length(which(is.na(lambdap_5_tau_5$NetworkID)))), by=1)	
	return(lambdap_5_tau_5)
}