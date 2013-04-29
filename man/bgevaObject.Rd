\name{bgevaObject}
\alias{bgevaObject}

\title{Fitted bgeva object}

\description{A fitted Binary Generalized Extreme Value Additive object returned by function \code{bgeva} and of class.}


\value{ 


\item{fit}{A list of values and diagnostics extracted from the output of the algorithm. For instance, \code{fit$argument} and \code{fit$S.h} return
           the estimated parameters and overall penalty matrix scaled by its smoothing parameters, for the model. See the 
           documentation of \code{trust} for diagnostics.}

\item{coefficients}{The coefficients of the fitted model provided as follows. Parametric and regression spline
                    coefficients.}

\item{gam.fit}{A univariate logistic additive model object. See the documentation of \code{mgcv} for full details.}

\item{sp}{Estimated smoothing parameters of the smooth components for the fitted model.}

\item{fp}{If \code{TRUE}, then a fully parametric model was fitted.} 

\item{iter.sp}{Number of iterations performed for the smoothing parameter estimation step.}

\item{iter.if}{Number of iterations performed in the initial step of the algorithm.}

\item{iter.inner}{Number of iterations performed inside smoothing parameter estimation step.}

\item{tau}{The tail parameter of the link function.}

\item{n}{Sample size.}

\item{X}{It returns the design matrix associated with the linear predictor.}

\item{Xr}{It returns the design matrix actually used in model fitting.}

\item{good}{It returns a vector indicating which observations have been discarded in the final iteration.}

\item{X.d2}{Number of columns of the design matrix. This is used for internal calculations.}

\item{l.sp}{Number of smooth components.}

\item{He}{Penalized hessian.}

\item{HeSh}{Unpenalized hessian.}

\item{Vb}{Inverse of the penalized hessian. This corresponds to the Bayesian variance-covariance matrix used for `confidence' interval calculations.}

\item{F}{This is given by \code{Vb*HeSh}.} 

\item{t.edf}{Total degrees of freedom of the estimated model. It is calculated as \code{sum(diag(F))}.}

\item{bs.mgfit}{A list of values and diagnostics extracted from \code{magic}.}

\item{conv.sp}{If \code{TRUE} then the smoothing parameter selection algorithm converged.}
                
\item{wor.c}{It contains the working model quantities given by the square root of 
             the weight matrix times the pseudo-data vector and design matrix, \code{rW.Z} and \code{rW.X}.}                

\item{eta}{The estimated linear predictor.}

\item{logL}{It returns the value of the (unpenalized) log-likelihood evaluated at the (penalized or unpenalized) parameter 
            estimates.}


}


\author{

Maintainer: Giampiero Marra \email{giampiero.marra@ucl.ac.uk}

}






\seealso{
\code{\link{bgeva}}, \code{\link{plot.bgeva}}, \code{\link{summary.bgeva}}
}











