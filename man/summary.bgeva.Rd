\name{summary.bgeva}
\alias{summary.bgeva}

\title{bgeva summary}

\description{
It takes a fitted \code{bgeva} object produced by \code{bgeva()} and produces some summaries from it.
}

\usage{

\method{summary}{bgeva}(object,s.meth="svd",sig.lev=0.05,...)

                         
}


\arguments{ 

\item{object}{A fitted \code{bgeva} object as produced by \code{bgeva()}.}

\item{s.meth}{Matrix decomposition used to determine the matrix root of the covariance matrix. See the documentation of \code{mvtnorm} for further details.} 

\item{sig.lev}{Significance level used for intervals obtained via posterior simulation.} 

\item{...}{Other arguments.}

}


\details{ 

As in the package \code{mgcv}, based on the results of Wood (2013), `Bayesian p-values' are returned for the smooth terms. These have 
better frequentist performance than their frequentist counterpart. Let \eqn{\hat{\bf f}}
and \eqn{{\bf V}_f}{V_f} denote the vector of values of a smooth term evaluated at the original covariate values and the
corresponding Bayesian covariance matrix, and let \eqn{{\bf V}_f^{r-}}{V_f^{r-}} denote 
the rank \eqn{r}{r} pseudoinverse of \eqn{{\bf V}_f}{V_f}. The statistic used 
is \eqn{T=\hat{\bf f}^\prime {\bf V}_f^{r-} \hat{\bf f}}. This is 
compared to a chi-squared distribution with degrees of freedom given by \eqn{r}{r}, which is obtained by 
biased rounding of the estimated degrees of freedom. See Wood (2013) for further details. 

Note that covariate selection can also be achieved using a single penalty shrinkage approach as shown in Marra and Wood (2011). 

Consider also using the version of the model implemented in the \code{gamlss()} function of the 
\code{SemiParBIVProbit} package, where p-value calculations are more rigorous.

}



\value{

\item{tableP}{It returns a table containing parametric estimates, their standard errors, z-values and p-values.}
\item{tableNP}{It returns a table of nonparametric summaries for each smooth component including estimated degrees of freedom, estimated rank, approximate Wald statistic for testing the null hypothesis that the smooth term is zero, and p-value.}
\item{n}{Sample size.}
\item{tau}{Tail parameter of the link function.}
\item{formula}{The original GAM formula used.}
\item{l.sp}{Number of smooth components.}
\item{t.edf}{Total degrees of freedom of the estimated model.}

}

\references{

Marra G. and Wood S.N. (2011), Practical Variable Selection for Generalized Additive Models. \emph{Computational Statistics and Data Analysis}, 55(7), 2372-2387.

Wood, S.N. (2013). On p-values for smooth components of an extended generalized additive model. \emph{Biometrika}, 100(1), 221-228.

}



\author{

Maintainer: Giampiero Marra \email{giampiero.marra@ucl.ac.uk}

}



\seealso{
\code{\link{bgevaObject}}, \code{\link{plot.bgeva}}
}

\examples{
## see examples for bgeva
}


\keyword{Binary GEVA modelling}
\keyword{information criteria}
\keyword{smooth}
\keyword{tail parameter}
\keyword{regression}
\keyword{shrinkage smoother}
\keyword{variable selection}






