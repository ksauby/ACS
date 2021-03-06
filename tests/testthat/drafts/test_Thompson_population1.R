
	
	
	
	
	

		
	
	
	
	
	
	
	
	



test_that("calculateSamplingBias and calculateRE", {
	# PREP DATA
	data(Thompson1990Fig1Pop)
	# calculate y_value estimates
	samplesizes <- data.frame(
		seed = 1:150,
		N.SRSWOR.plots = rep(seq(from=130, to=280, by=30), each=25)
	)
	y_value_mean_observed <- vector()
	y_value_var_observed <- vector()
		for (i in 1:dim(samplesizes)[1]) {
			temp <- createSRS(
				population=Thompson1990Fig1Pop, 
				seed=samplesizes$seed[i], 
				n1=samplesizes$N.SRSWOR.plots[i]
			)
			y_value_mean_observed[i] <- mean(temp$y_value)
			y_value_var_observed[i] <- var(temp$y_value)
		}
	data <- cbind(samplesizes, y_value_mean_observed, y_value_var_observed)
	# summarise population data
	Thompson1990Fig1Pop_summary <- 
		calculatePopulationSummaryStatistics(
			population_data		= Thompson1990Fig1Pop, 
			summary.variables 	= "y_value", 
			grouping.variables 	= NULL, 
			ratio.variables 	= NULL
		)
	# sampling bias
	data_summary <- data %>%
		mutate(
			observed_minus_true_sqd = (
				y_value_mean_observed - 
				Thompson1990Fig1Pop_summary$y_value_mean
		)^2) %>%
		group_by(N.SRSWOR.plots) %>%
		summarise(
			y_value_mean_RB = (
				# mean of HT estimates
				mean(y_value_mean_observed) - 
				# mu, population mean
				Thompson1990Fig1Pop_summary$y_value_mean
			) / Thompson1990Fig1Pop_summary$y_value_mean * 100,
			y_value_var_RB = (
				mean(y_value_var_observed) - var(y_value_mean_observed)
			) / var(y_value_mean_observed) * 100,
			sum_observed_minus_true_sqd = sum(observed_minus_true_sqd), 
				length_y_value_mean_observed = length(y_value_mean_observed),
			y_value_mean_MSE = sum(observed_minus_true_sqd) / 
				length(y_value_mean_observed)
		) %>%
		as.data.frame
	temp <- data_summary %>% dplyr::select(y_value_mean_RB, y_value_var_RB)

	temp$y_value_mean_RB %<>% round(3)
	temp$y_value_var_RB %<>% round(3)

	data_summary_stats <- calculateSamplingBias(
		population_data_summary	= Thompson1990Fig1Pop_summary, 
		simulation_data		= data, 
		population.grouping.variables = NULL, 
		sampling.grouping.variables	= "N.SRSWOR.plots", 
		variables			= "y_value", 
		rvar				= NULL 
	) %>%
	as.data.frame

	expect_that(
		data_summary_stats %>%
		dplyr::select(
			y_value_mean_RB,
			y_value_var_RB
		) %>%
		round(3),
		equals(temp),
		label="calculateSamplingBias, bias calculation of mean and variances"
	)
	
	temp <- data_summary %>% dplyr::select(y_value_mean_MSE)
	temp$y_value_mean_MSE %<>% round(3)
	
	expect_that(
		data_summary_stats %>%
		dplyr::select(
			y_value_mean_MSE
		) %>%
		round(3),
		equals(temp),
		label="calculateSamplingBias, MSE function"
	)

	# ACS SAMPLING
	y_value_var_observed <- vector()
	total_sample_size <- vector()
	for (i in 1:dim(samplesizes)[1]) {
		temp <- createACS(
			population=Thompson1990Fig1Pop, 
			seed=samplesizes$seed[i], 
			n1=samplesizes$N.SRSWOR.plots[i],
			y_variable="y_value"
		)
		y_value_mean_observed[i] <- y_HT(
			y = temp$y_value,
			N = dim(Thompson1990Fig1Pop)[1],
			n1 = samplesizes$N.SRSWOR.plots[i],
			m = temp$m
		)
		y_value_var_observed[i] <- var_y_HT(
			y = temp$y_value,
			N = dim(Thompson1990Fig1Pop)[1],
			n1 = samplesizes$N.SRSWOR.plots[i],
			m = temp$m
		)
		total_sample_size[i] <- dim(temp)[1]
	}
	ACSdata <- cbind(
		samplesizes,
		y_value_mean_observed,
		y_value_var_observed,
		total_sample_size
	)


	temp <- ACSdata %>%
		group_by(N.SRSWOR.plots) %>%
		summarise(mean_total_sample_size = round(mean(total_sample_size, na.rm=T),0))
	ACSdata_re <- ACSdata %>% merge(temp, by="N.SRSWOR.plots")



	ACSdata_summary_stats <- calculateSamplingBias(
		population_data_summary	= Thompson1990Fig1Pop_summary, 
		simulation_data		= ACSdata_re, 
		population.grouping.variables = NULL, 
		sampling.grouping.variables	= "mean_total_sample_size", 
		variables			= "y_value", 
		rvar				= NULL 
	) %>%
	as.data.frame
	
	population_variance <- var(Thompson1990Fig1Pop$y_value)
			
	RE_values <-  
		(population_variance / ACSdata_summary_stats$mean_total_sample_size) / 
		ACSdata_summary_stats$y_value_mean_MSE
	expect_that(
		calculateRE(
			MSE_ComparisonSamplingDesign = ACSdata_summary_stats,
			population_data = Thompson1990Fig1Pop,
			population.grouping.variables = NULL,
			sampling.grouping.variables = NULL,
			sample.size.variable = "mean_total_sample_size",
			variables = "y_value"
		) %$% y_value_mean_RE,
		equals(RE_values),
		label="calculateRE"
	)
})

save(RE_values, file="RE_values_25nov16.rda")