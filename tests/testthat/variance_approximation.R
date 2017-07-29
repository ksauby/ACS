test_that("Hajek, Hajek Variance Approximation", {
	# p. 138, from Tille, Y (2006) Sampling Algorithms. Springer.
	N=6
	n=3
	pi_i_values = c(0.07, 0.17, 0.41, 0.61, 0.83, 0.91)

	
	
	expect_that(
		Hajek(pi_i = pi_i_values, n = N),
		equals(c(0.07812, 0.16932, 0.29028, 0.28548, 0.16932, 0.09828))
	)
})







Hartley_Rao(pi_i = pi_i_values, n = N)
# negative numbers
Rosen(pi_i = pi_i_values, n = N)
# really large numbers
Berger(pi_i = pi_i_values, n = N)
# negative numbers
Deville(pi_i = pi_i_values, n = N)



# Hartley and Rao Example

Hartley_Rao_data <- data.frame(
	y_i = c(
		19,9,17,14,21,22,27,35,20,15,
		18,37,12,47,27,25,25,13,19,12
	),
	x_i = c(
		18,9,14,12,24,25,23,24,17,14,
		18,40,12,30,27,26,21,9,19,12
	)
)
pi_i_values <- Hartley_Rao_data$x_i/(sum(Hartley_Rao_data$x_i))


# total sample size?




#' # Initiate ACS
#' Z = createACS(Thompson1990Figure1Population, seed=3, n1=30, "y_value", condition=0)

Z_summary <- Z %>% 
	filter(Sampling!="Edge") %>%
	group_by(NetworkID) %>%
	summarise(
		m = m[1],
		y_total = sum(y_value, rm.na=TRUE)
		) %>%
		filter(NetworkID > 0)

var_y_HT(
	N = dim(Thompson1990Figure1Population)[1], 
	n1 = dim(Thompson1990Figure1Sample)[1], 
	m = Z_summary$m, 
	y = Z_summary$y_total
)


Hajek(pi_i=pi_i_values, n=900)

pi_i_values <- pi_i(N=900,n1=30, m=Z$m)

var_pi(
	n = 900, 
	y = Z$y_value, 
	pi_i_values = pi_i_values,
	alpha_i = "Hajek", 
	z_i = 1
)