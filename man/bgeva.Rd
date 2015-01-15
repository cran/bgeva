\name{bgeva}
\alias{bgeva}

\title{Binary Generalized Extreme Value Additive Modelling}

\description{ 
\code{bgeva} can be used to fit regression models for binary rare events where the link function is the quantile function of 
the Generalized Extreme Value random variable. The linear predictor can be flexibly specified using parametric and 
regression spline components. Regression 
spline bases are extracted from the package \code{mgcv}. Multi-dimensional smooths are available 
via the use of penalized thin plate regression splines (isotropic). The current implementation does not support scale invariant tensor 
product smooths. 

}



\usage{
bgeva(formula.eq, data=list(), tau=-0.25, Hes=TRUE, gIM="a", iterlimSP=50, 
                  pr.tol=1e-6, 
                  gamma=1, aut.sp=TRUE, fp=FALSE, start.v=NULL, start.vo=1, 
                  rinit=1, rmax=100, fterm=sqrt(.Machine$double.eps), 
                  mterm=sqrt(.Machine$double.eps),   
                  control=list(maxit=50,tol=1e-6,step.half=25,
                               rank.tol=sqrt(.Machine$double.eps)))
}


\arguments{ 

\item{formula.eq}{A GAM formula. \code{s} terms are used to specify smooth functions of 
                  predictors. See the examples below and the documentation of \code{mgcv} for further details on GAM formula specifications.} 

\item{data}{An optional data frame, list or environment containing the variables in the model.  If not found in \code{data}, the
            variables are taken from \code{environment(formula)}, typically the environment from which \code{bgeva} is called.} 

\item{tau}{Shape parameter of the GEV distribution. It must be provided.} 

\item{Hes}{If \code{FALSE}, then the Fisher (rather than the observed) information matrix is employed.}

\item{gIM}{Different versions of GEV distribution. Options are \code{a} and \code{b}.}

\item{iterlimSP}{A positive integer specifying the maximum number of loops to be performed before the smoothing parameter estimation step is terminated.} 

\item{pr.tol}{Tolerance to use in judging convergence of the algorithm when automatic smoothing parameter selection is used.} 

\item{gamma}{It is an inflation factor for the model degrees of freedom in the UBRE score. Smoother models can be obtained setting 
             this parameter to a value greater than 1. Typically \code{gamma=1.4} achieves this.}

\item{aut.sp}{If \code{TRUE}, then automatic multiple smoothing parameter selection is carried out. If \code{FALSE}, then smoothing parameters 
              are set to the values obtained from the univariate fits.}

\item{fp}{If \code{TRUE}, then a fully parametric model with regression splines is fitted. See the example below.}  

\item{start.v}{Starting values for the parameters can be provided here.}  

\item{start.vo}{Default is 1 meaning that starting values are obtained from fitting a logistic model. Otherwise, these can be set as described in Calabrese and Osmetti (2013) (\code{start.vo=2}) or from a 
                combination of options 1 and 2 (\code{start.vo=3}).} 

\item{rinit}{Starting trust region radius. The trust region radius is adjusted as the algorithm proceeds. See the documentation
             of \code{trust} for further details.}

\item{rmax}{Maximum allowed trust region radius. This may be set very large. If set small, the algorithm traces a steepest 
            descent path.}        
        
\item{fterm}{Positive scalar giving the tolerance at which the difference in objective function values in a step is considered close 
             enough to zero to terminate the algorithm.}

\item{mterm}{Positive scalar giving the tolerance at which the two-term Taylor-series approximation to the difference in objective 
             function values in a step is considered close enough to zero to terminate the algorithm.}

\item{control}{It is a list containing iteration control constants with the following elements: \code{maxit}: maximum number of iterations of the 
               \code{magic} algorithm; \code{tol}: tolerance to use in judging convergence; \code{step.half}: if a trial step fails then 
               the method tries halving it up to a maximum of \code{step.half} times; \code{rank.tol}: constant used to test for numerical rank 
               deficiency of the problem. See the documentation of \code{magic} in \code{mgcv} for further details.}



}


\details{

The Binary Generalized Extreme Value Additive model has the quantile function of the Generalized Extreme Value (GEV) random variable as link 
function. The linear predictor is flexibly specified using 
parametric components and smooth functions of covariates. Replacing the smooth components with their regression 
spline expressions yields a fully parametric univariate GEV model. In principle, classic 
maximum likelihood estimation can be employed. However, to avoid overfitting, penalized likelihood maximization has to be employed instead. Here the 
use of 
penalty matrices allows for the suppression of that part of smooth term complexity which has no support from the data. The trade-off 
between smoothness 
and fitness is controlled by smoothing parameters associated with the penalty matrices. Smoothing parameters are chosen to 
minimize the approximate Un-Biased Risk Estimator (UBRE).

Automatic smoothing parameter selection is integrated 
using a performance-oriented iteration approach (Gu, 1992; Wood, 2004). At each iteration, (i) the penalized weighted least squares 
problem is solved, then (ii) the smoothing parameters of that problem estimated by approximate UBRE. Steps (i) and (ii) are iterated until 
convergence.

Full details can be found in Calabrese, Marra and Osmetti (2013).


}


\value{
The function returns an object of class \code{bgeva} as described in \code{bgevaObject}.
}

\section{WARNINGS}{

Any automatic smoothing parameter selection procedure is not likely to work well when the data have low information content. In binary models, this 
issue is especially relevant the number of observations low. Here, convergence failure is
typically associated with an infinite cycling between the two steps detailed above. If this occurs, as some practical solutions, one might 
either (i) lower the total number of parameters to estimate by reducing the dimension of the regression spline 
bases, (ii) set the smoothing parameters to the values obtained from the univariate fits (\code{aut.sp=FALSE}), or (iii) set the smoothing 
parameters to the values obtained from the non-converged algorithm. The default option is (iii).


The GEV distribution may not be defined for certain combinations of parameter and covariate values. In such cases, a sub-design matrix is formed. This 
consists of the rows (of the original design matrix) for which the distributrion is defined.

} 


\author{

Maintainer: Giampiero Marra \email{giampiero.marra@ucl.ac.uk}

}



\references{

Calabrese R., Marra G., Osmetti S.A. (2013), Bankruptcy Prediction of Small and Medium Enterprises Using a Flexible Binary Generalized Extreme Value Model. \emph{Submitted}.

Calabrese R., Osmetti S.A. (2013), Modelling SME Loan Defaults as Rare Events: The Generalized Extreme Value Regression Model. \emph{Journal of Applied Statistics}.

Gu C. (1992), Cross validating non-Gaussian data. \emph{Journal of Computational and Graphical Statistics}, 1(2), 169-179.

Wood S.N. (2004), Stable and efficient multiple smoothing parameter estimation for generalized additive models. \emph{Journal of the American Statistical Association}, 99(467), 673-686.

}



\seealso{
\code{\link{plot.bgeva}}, \code{\link{bgeva-package}}, \code{\link{bgevaObject}}, \code{\link{summary.bgeva}}
}

\examples{

library(bgeva)

##########
## EXAMPLE 
##########

set.seed(0)

n <- 1500

x1 <- round(runif(n))
x2 <- runif(n)
x3 <- runif(n)

f1 <- function(x) (cos(pi*2*x)) + sin(pi*x)
f2 <- function(x) (x+exp(-30*(x-0.5)^2))   

y <- as.integer(rlogis(n, location = -6 + 2*x1 + f1(x2) + f2(x3), scale = 1) > 0)

dataSim <- data.frame(y,x1,x2,x3)

out <- bgeva(y ~ x1 + s(x2) + s(x3))
bg.checks(out)

summary(out)
plot(out,scale=0,pages=1,shade=TRUE)


#
#

}


\keyword{binary rare events data} 
\keyword{generalized extreme value distribution} 
\keyword{link function}
\keyword{smooth} 
\keyword{regression spline}









