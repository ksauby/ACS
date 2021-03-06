test_that("Error Handling - popdata", {
     popdata <- TRUE
     expect_error(
          handleError_popdata(popdata),
          "The 'popdata' argument must be supplied with a data frame including the columns 'x', 'y', and 'NetworkID'."
     )
     popdata <- NA
     expect_error(
          handleError_popdata(popdata),
          "The 'popdata' argument must be supplied with a data frame including the columns 'x', 'y', and 'NetworkID'."
     )
     popdata <- 1
     expect_error(
          handleError_popdata(popdata),
          "The 'popdata' argument must be supplied with a data frame including the columns 'x', 'y', and 'NetworkID'."
     )
     popdata <- "random text"
     expect_error(
          handleError_popdata(popdata),
          "The 'popdata' argument must be supplied with a data frame including the columns 'x', 'y', and 'NetworkID'."
     )
     popdata <- data.frame(
          x=seq(1:5),
          y=seq(6:10),
          NetworkID=1
     )
     expect_silent(handleError_popdata(popdata))
})
test_that("Error Handling - seed", {
     seed <- TRUE
     expect_error(
          handleError_seed(seed),
          "The 'seed' argument must be a vector of integer values."
     )
     seed <- "random text"
     expect_error(
          handleError_seed(seed),
          "The 'seed' argument must be a vector of integer values."
     )
     seed <- 1
     expect_silent(
          handleError_seed(seed)
     )
     seed <- seq(1:100)
     expect_silent(
          handleError_seed(seed)
     )
     seed <- 1.2
     expect_silent(
             handleError_seed(seed)
        )
})
test_that("Error Handling - yvar", {
     yvar <- TRUE
     expect_error(
          handleError_yvar(yvar),
          "The argument 'yvar' must be a character string."
     )
     yvar <- NA
     expect_error(
          handleError_yvar(yvar),
          "The argument 'yvar' must be a character string."
     )
     yvar <- 1
     expect_error(
          handleError_yvar(yvar),
          "The argument 'yvar' must be a character string."
     )
     yvar <- c("random text", "blah blah")
     expect_error(
          handleError_yvar(yvar),
          "The argument 'yvar' must be a character string."
     )
     yvar <- "blah"
     expect_silent(
          handleError_yvar(yvar)
     )
})
test_that("Error Handling - n1", {
     n1 <- TRUE
     expect_error(
          handleError_n1(n1),
          "The argument 'n1' must be an integer value."
     )
     n1 <- NA
     expect_error(
          handleError_n1(n1),
          "The argument 'n1' must be an integer value."
     )
     n1 <- 1.2
     expect_error(
          handleError_n1(n1),
          "The argument 'n1' must be an integer value."
     )
     n1 <- "random text"
     expect_error(
          handleError_n1(n1),
          "The argument 'n1' must be an integer value."
     )
     n1 <- c(1,3,2)
     expect_error(
          handleError_n1(n1),
          "The argument 'n1' must be an integer value."
     )
     n1 <- 1
     expect_silent(handleError_n1(n1))
})   
test_that("Error Handling - n1vector", {
     n1 <- TRUE
     expect_error(
          handleError_n1vector(n1),
          "The argument 'n1' must be an integer value or vector of integers"
     )
     n1 <- NA
     expect_error(
          handleError_n1vector(n1),
          "The argument 'n1' must be an integer value or vector of integers"
     )
     n1 <- 1.2
     expect_error(
          handleError_n1vector(n1),
          "The argument 'n1' must be an integer value or vector of integers"
     )
     n1 <- "random text"
     expect_error(
          handleError_n1vector(n1),
          "The argument 'n1' must be an integer value or vector of integers"
     )
     n1 <- c(1.5,2)
     expect_error(
          handleError_n1vector(n1),
          "The argument 'n1' must be an integer value or vector of integers"
     )
     n1 <- c(1,3,2)
     expect_silent(handleError_n1vector(n1))
})  
test_that("Error Handling - coord", {
     coord <- TRUE
     expect_error(
          handleError_coord(coord),
          "A non-numeric value was passed to one of the coordinate arguments. Please provide a number.",
     )
     coord <- NA
     expect_error(
          handleError_coord(coord),
          "A non-numeric value was passed to one of the coordinate arguments. Please provide a number.",
     )
     coord <- "random text"
     expect_error(
          handleError_coord(coord),
          "A non-numeric value was passed to one of the coordinate arguments. Please provide a number.",
     )
     coord <- c(1,3,2)
     expect_error(
          handleError_coord(coord),
          "A non-numeric value was passed to one of the coordinate arguments. Please provide a number.",
     )
     coord <- 1.2
     expect_silent(handleError_coord(coord))
     coord <- 1
     expect_silent(handleError_coord(coord))
})   
test_that("Error Handling - condition", {
     condition <- NA
     expect_error(
          handleError_condition(condition),
          "The argument 'condition' must be a numeric value.",
     )
     condition <- TRUE
     expect_error(
          handleError_condition(condition),
          "The argument 'condition' must be a numeric value.",
     )
     condition <- "random text"
     expect_error(
          handleError_condition(condition),
          "The argument 'condition' must be a numeric value.",
     )
     condition <- c(1,3,2)
     expect_error(
          handleError_condition(condition),
          "The argument 'condition' must be a single numeric value.",
     )
     condition <- 10
     expect_silent(handleError_condition(condition))
     condition <- 1.2
     expect_silent(handleError_condition(condition))
})
test_that("Error Handling - LogicalVar", {
     LogicalVar <- NA
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- "random text"
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- c(1,3,2)
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- c("blah", "blah")
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- c("TRUE", "FALSE")
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- "TRUE"
     expect_error(
          handleError_LogicalVar(LogicalVar, "Logical Variable"),
          "The argument 'Logical Variable' must be assigned a value of either TRUE or FALSE.",
     )
     LogicalVar <- TRUE
     expect_silent(handleError_LogicalVar(LogicalVar, "Logical Variable"))
     LogicalVar <- FALSE
     expect_silent(handleError_LogicalVar(LogicalVar, "Logical Variable"))
})
test_that("Error Handling - handleError_variable", {
     variable <- c(1, 2, 3)
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- 1
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- NULL
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- FALSE
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- NA
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- data.frame(c(1,2,3))
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- matrix(c(1,2,3))
     expect_error(
          handleError_variable(variable, "variable"),
          "The argument 'variable' must be a character string or a vector of character strings."
     )
     variable <- c("var1", "var2")
     expect_silent(handleError_variable(variable, "variable"))
     variable <- "var1"
     expect_silent(handleError_variable(variable, "variable"))
})
test_that("Error Handling - handleError_vars", {
     avar <- "blah"; ovar <- 1; rvar = NULL
     vars <- c(avar, ovar, rvar)
     expect_silent(handleError_vars(vars))
     avar <- NULL; ovar <- NULL; rvar = NULL
     vars <- c(avar, ovar, rvar)
     expect_error(
          handleError_vars(vars),
          "At least one variable, via the arguments 'ovar', 'avar', or 'rvar', must be supplied for estimation."
     )
     avar <- NA; ovar <- NA; rvar = NA
     vars <- c(avar, ovar, rvar)
     expect_error(
          handleError_vars(vars),
          "At least one variable, via the arguments 'ovar', 'avar', or 'rvar', must be supplied for estimation."
     )
     avar <- NA; ovar <- NA; rvar = NULL
     vars <- c(avar, ovar, rvar)
     expect_error(
          handleError_vars(vars),
          "At least one variable, via the arguments 'ovar', 'avar', or 'rvar', must be supplied for estimation."
     )
})
test_that("Error Handling - handleError_singlepopulation", {
     N <- 2
     expect_silent(handleError_singlepopulation(N))
     N <- c(2, 2)
     expect_error(
          handleError_singlepopulation(N),
          "N must be a single integer value."
     )
     N <- "blah"
     expect_error(
          handleError_singlepopulation(N),
          "N must be a single integer value."
     )
     N <- c("bah", "blah")
     expect_error(
          handleError_singlepopulation(N),
          "N must be a single integer value."
     )
     N <- TRUE
     expect_error(
          handleError_singlepopulation(N),
          "N must be a single integer value."
     )
     N <- 1.2
     expect_error(
          handleError_singlepopulation(N),
          "N must be a single integer value."
     )
})

