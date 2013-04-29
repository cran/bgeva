\name{bgeva-package}
\alias{bgeva-package}
\docType{package}

\title{Binary Generalized Extreme Value Additive Modelling}

\description{\code{bgeva} provides a function for univariate modelling for binary rare events data with linear and nonlinear predictor effects when using the quantile function of the Generalized Extreme Value random variable.
}

\details{\code{bgeva} provides a function for flexible regression models for binary rare events data. The underlying representation and 
estimation of the model is based on a penalized regression spline approach, with automatic smoothness selection. The 
numerical routine carries out function minimization using a trust region algorithm from the package \code{trust} in combination with
an adaptation of a low level smoothness selection fitting procedure from the package \code{mgcv}. 
 
\code{\link{bgeva}} supports the use of many smoothers as extracted from \code{mgcv}. Scale invariant tensor product smooths
are not currently supported. Estimation is by penalized maximum likelihood with automatic smoothness selection achieved 
by using the approximate Un-Biased Risk Estimator (UBRE). 

Confidence intervals for smooth components are derived using a Bayesian approach. Approximate p-values for testing 
individual smooth terms for equality to the zero function are also provided. Functions \code{\link{plot.bgeva}} and 
\code{\link{summary.bgeva}} extract such information from a fitted \code{\link{bgevaObject}}. Variable 
selection is also possible via the use of shrinakge smoothers or information criteria. 


}


\author{
Raffaella Calabrese (University of Milano-Bicocca, Department of Statistics and Quantitative Methods), Giampiero Marra (University College London, Department of Statistical Science) and Silvia Osmetti (University Cattolica del Sacro Cuore, Department of Statistics) 

Maintainer: Giampiero Marra \email{giampiero.marra@ucl.ac.uk}
}

\references{

Calabrese R., Marra G., Osmetti S.A. (2013), Bankruptcy Prediction of Small and Medium Enterprises Using a Flexible Generalized Extreme Value Model. \emph{Submitted}.

Calabrese R., Osmetti S.A. (2013), Modelling SME Loan Defaults as Rare Events: The Generalized Extreme Value Regression Model. \emph{Journal of Applied Statistics}.

}


\seealso{
\code{\link{bgeva}}
}

\keyword{binary rare events data} 
\keyword{generalized extreme value distribution} 
\keyword{link function}
\keyword{package}
\keyword{smooth} 
\keyword{regression}
\keyword{model selection}

