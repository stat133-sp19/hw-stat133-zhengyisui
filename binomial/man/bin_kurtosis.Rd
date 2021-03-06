% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_kurtosis}
\alias{bin_kurtosis}
\title{bin_kurtosis}
\usage{
bin_kurtosis(trials, prob)
}
\arguments{
\item{trials}{trial numbers}

\item{prob}{success probability}
}
\value{
kurtosis of the binomial distribution given trials and probability
}
\description{
compute kurtosis of a binomial distribution given trials and probability
}
\examples{
bkurt <- bin_kurtosis(3, 0.5)
}
