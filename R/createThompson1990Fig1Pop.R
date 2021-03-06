#' Create the population displayed in Figure 1 from Thompson (1990)
#' 
#' @return The population displayed in Figure 1 from Thompson (1990).
#' @noRd


createThompson1990Fig1Pop <- function() {
	y_value <- NetworkID <- x <- y <- m <- NULL
	# create population
	empty = rep(0,20)
	P = rbind(
		c(rep(0,4),5,13,3,rep(0,13)),
		c(rep(0,4),2,11,2,rep(0,13)),
		as.data.frame(sapply(empty, rep, 11)), # rows 3-13
		c(rep(0,9),3,1,rep(0,9)),
		c(rep(0,8),5,39,10,rep(0,9)),
		c(rep(0,8),5,13,4,rep(0,9)),
		c(rep(0,7),2,22,3,rep(0,10)),
		c(rep(0,12),10,8,rep(0,6)),
		c(rep(0,12),7,22,rep(0,6)),
		c(rep(0,20))
	)
	# add x and y coordinates
	P = cbind(
		expand.grid(x = rev(1:20), y = 1:20), 
		y_value = as.vector(unlist(P))
		) #%>%
		#filter(y_value > 0)
	names(P)[1:2] <- c("y", "x")
	# assign network membership of units containing the species of interest
	P_networks <- assignNetworkMembership(P %>% filter(y_value > 0), plot.size=1)
	# fill in m values
	P = merge(P, P_networks, all=T)
	P[which(P$y_value==0), ]$m <- 1
	# fill in NetworkIDs
	maxID <- max(P$NetworkID, na.rm=T)
	P[which(is.na(P$NetworkID)), ]$NetworkID <- seq(from=(maxID + 1), 
		to=(maxID + length(which(is.na(P$NetworkID)))), by=1)
	P %<>% 
		arrange(NetworkID) %>%
		select(
		     .data$x, 
		     .data$y, 
		     .data$NetworkID, 
		     .data$m, 
		     .data$y_value
		    )
	return(P)
}

