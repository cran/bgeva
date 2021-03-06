\name{plot.bgeva}
\alias{plot.bgeva}

\title{bgeva plotting}


\description{It takes a fitted \code{bgeva} object produced by \code{bgeva()} and plots the 
component smooth functions that make it up on the scale of the linear predictor. 

This function is based on \code{plot.gam()} in \code{mgcv}. Please see the documentation of \code{plot.gam()} for full details. 

}

\usage{
\method{plot}{bgeva}(x, ...)
}


\arguments{ 
  
\item{x}{A fitted \code{bgeva} object as produced by \code{bgeva()}.}

\item{...}{Other graphics parameters to pass on to plotting commands, as described for \code{plot.gam} in \code{mgcv}.}


}


\details{

This function produces plot showing the smooth terms of a fitted semiparametric bivariate probit model. For plots 
of 1-D smooths, the x axis of each plot is labelled using the name of the regressor, while the y axis is labelled as \code{s(regr,edf)} 
where \code{regr} is the regressor name, and \code{edf} the estimated degrees of freedom of the smooth. As for 2-D smooths, perspective plots are produced with the x-axes labelled with the first and second variable names and the y axis 
is labelled as \code{s(var1,var2,edf)}, which indicates the variables of which the term is a function and the \code{edf} for the term. 

If \code{seWithMean=TRUE}, then the confidence intervals include the uncertainty about the overall mean. That is, 
although each smooth is shown centred, the confidence intervals are obtained as if every other term in the model was 
constrained to have average 0 (average taken over the covariate values) except for the smooth being plotted. The theoretical arguments 
and simulation study of Marra and Wood (2012) suggests that \code{seWithMean=TRUE} results in intervals with
close to nominal frequentist coverage probabilities. This option should not be used when fitting a random effect model.

}



\value{
The function generates plots.
}



\author{

Maintainer: Giampiero Marra \email{giampiero.marra@ucl.ac.uk}

}



\references{

Marra G. and Wood S.N. (2012), Coverage Properties of Confidence Intervals for Generalized Additive Model Components. \emph{Scandinavian Journal of Statistics}, 39(1), 53-74.

}


\section{WARNING}{ 

The function can not deal with smooths of more than 2 variables.

} 



\seealso{
\code{\link{bgeva}}, \code{\link{summary.bgeva}}
}



\examples{
## see examples for bgeva
}

\keyword{smooth} 
\keyword{regression} 
\keyword{hplot}






