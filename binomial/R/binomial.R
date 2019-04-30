
check_prob <- function(prob){
  # private. Used to check the validity of prob.
  if(length(prob) == 1){
    if(prob >= 0 & prob <= 1)
      return(TRUE)
    else
      stop("p has to be a number betwen 0 and 1")
  }else
    stop("p must be of length 1")
}


check_trials <- function(trials){
  # private. Used to check the validity of number of trials.
  if(length(trials) == 1){
    if(trials >= 0)
      return(TRUE)
    else
      stop("invalid trials value")
  }else
    stop("trials must be of length 1")
}


check_success <- function(success, trials){
  # private. Used to check the validity of success numbers.
  if(all(success <= trials) & all(success >= 0))
    return(TRUE)
  else
    stop("invalid success value")
}


aux_mean <- function(trials, prob){
  # compute mean
  return(trials * prob)
}


aux_variance <- function(trials, prob){
  # compute variance
  return(trials * prob * (1 - prob))
}


aux_mode <- function(trials, prob){
  # compute mode
  return(floor(trials * prob + prob))
}


aux_skewness <- function(trials, prob){
  # compute skewness
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}


aux_kurtosis <- function(trials, prob){
  # compute kurtosis
  return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}


#' @title bin_choose
#' @description compute combinations in which k successes can occur in n trials
#' @param n trial numbers
#' @param k success numbers
#' @return the combination of k successes can occur in n trials
#' @export bin_choose
#' @examples
#' bc <- binchoose(3, 2)
bin_choose <- function(n, k){
  if(all(k <= n) & all(k >= 0))
    return(factorial(n)/factorial(k)/factorial(n-k))
  else if(any(k > n))
    stop("k cannot be greater than n")
  else
    stop("k cannot be less than 0")
}


#' @title bin_probability
#' @description compute probability of k successes in n trials
#' @param success success numbers
#' @param trials trial numbers
#' @param prob success probability
#' @return the probability of k successes in n trials
#' @export bin_probability
#' @examples
#' bp <- bin_probability(2, 3, 0.5)
bin_probability <- function(success, trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  val_success <- check_success(success, trials)
  if(val_trials & val_prob & val_success)
    return(bin_choose(trials, success) * prob^success * (1-prob)^(trials-success))
  else if(val_trials == FALSE)
    stop("invalid trials value")
  else if(val_success == FALSE)
    stop("invalid success value")
  else
    stop("invalid probability")
}


#' @title bin_distribution
#' @description compute distribution of a n trials experiment
#' @param trials trial numbers
#' @param prob success probability
#' @return a data frame containing distribution of a n trials experiment
#' @export bin_distribution
#' @examples
#' bd <- bin_distribution(3, 0.5)
bin_distribution <- function(trials, prob){
  df <- as.data.frame(matrix(0, ncol = 2, nrow = (trials + 1)))
  class(df) <- c("bindis", "data.frame")
  colnames(df) <- c("success", "probability")
  for(i in 0:trials){
    df[i+1,1] = i
    df[i+1,2] = bin_probability(i, trials, prob)
  }
  return(df)
}
#' @export
plot.bindis <- function(data){
  vec <- data[,2]
  names(vec) <- data[,1]
  barplot(vec, xlab = "successes", ylab = "probability", las = 1)
  # invisible(data)
}


#' @title bin_cumulative
#' @description compute cumulative distribution of a n trials experiment
#' @param trials trial numbers
#' @param prob success probability
#' @return a data frame containing cumulative distribution of a n trials experiment
#' @export bin_cumulative
#' @examples
#' bcu <- bin_cumulative(3, 0.5)
bin_cumulative <- function(trials, prob){
  df <- bin_distribution(trials, prob)
  class(df) <- c("bincum", "data.frame")
  for(i in 1:nrow(df)){
    df$cumulative[i] = sum(df$probability[1:i])
  }
  return(df)
}
#' @export plot.bincum
plot.bincum <- function(data){
  plot(x = data[,1], y = data[,3], type = "p",
       xlab = "success", ylab = "probability", las = 1)
  lines(x = data[,1], y = data[,3], type = "l")
  # invisible(data)
}


#' @title bin_variable
#' @description describe the trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return a list containing trials and probability
#' @export bin_variable
#' @examples
#' bc <- bin_variable(3, 0.5)
bin_variable <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  element <- list(trials = trials, prob = prob)
  class(element) <- "binvar"
  return(element)
}
#' @export print.binvar
print.binvar <- function(binvar){
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials: ", binvar$trials, "\n")
  cat("- prob of success:  ", binvar$prob, "\n\n")
  invisible(binvar)
}

#' @export summary.binvar
summary.binvar <- function(binvar){
  sum <- list(trials = binvar$trials,
              prob = binvar$prob,
              mean = aux_mean(binvar$trials, binvar$prob),
              variance = aux_variance(binvar$trials, binvar$prob),
              mode = aux_mode(binvar$trials, binvar$prob),
              skewness = aux_skewness(binvar$trials, binvar$prob),
              kurtosis = aux_kurtosis(binvar$trials, binvar$prob))
  class(sum) <- "summary.binvar"
  return(sum)
}
#' @export print.summary.binvar
print.summary.binvar <- function(sum){
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials: ", sum$trials, "\n")
  cat("- prob of success:  ", sum$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    : ", sum$mean, "\n")
  cat("- variance: ", sum$variance, "\n")
  cat("- mode    : ", sum$mode, "\n")
  cat("- skewness: ", sum$skewness, "\n")
  cat("- kurtosis: ", sum$kurtosis, "\n")
}


#' @title bin_mean
#' @description compute mean of a binomial distribution given trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return mean of the binomial distribution given trials and probability
#' @export bin_mean
#' @examples
#' bmean <- bin_mean(3, 0.5)
bin_mean <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  if(val_trials & val_prob)
    return(aux_mean(trials, prob))
}


#' @title bin_variance
#' @description compute variance of a binomial distribution given trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return variance of the binomial distribution given trials and probability
#' @export bin_variance
#' @examples
#' bvar <- bin_variance(3, 0.5)
bin_variance <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  if(val_trials & val_prob)
    return(aux_variance(trials, prob))
}


#' @title bin_mode
#' @description compute mode of a binomial distribution given trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return mode of the binomial distribution given trials and probability
#' @export bin_mode
#' @examples
#' bmode <- bin_mode(3, 0.5)
bin_mode <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  if(val_trials & val_prob)
    return(aux_mode(trials, prob))
}


#' @title bin_skewness
#' @description compute skewness of a binomial distribution given trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return skewness of the binomial distribution given trials and probability
#' @export bin_skewness
#' @examples
#' bskew <- bin_skewness(3, 0.5)
bin_skewness <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  if(val_trials & val_prob)
    return(aux_skewness(trials, prob))
}


#' @title bin_kurtosis
#' @description compute kurtosis of a binomial distribution given trials and probability
#' @param trials trial numbers
#' @param prob success probability
#' @return kurtosis of the binomial distribution given trials and probability
#' @export bin_kurtosis
#' @examples
#' bkurt <- bin_kurtosis(3, 0.5)
bin_kurtosis <- function(trials, prob){
  val_trials <- check_trials(trials)
  val_prob <- check_prob(prob)
  if(val_trials & val_prob)
    return(aux_kurtosis(trials, prob))
}
