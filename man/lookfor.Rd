% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lookfor.R
\name{lookfor}
\alias{lookfor}
\title{Look for keywords variable names and descriptions}
\source{
Based on the behaviour of the \code{lookfor} command in Stata.
}
\usage{
lookfor(data, ..., labels = TRUE, ignore.case = TRUE, details = FALSE)
}
\arguments{
\item{data}{a data frame}

\item{...}{list of keywords, a character string (or several character strings), which can be formatted as a regular expression suitable for a \code{grep} pattern, or a vector of keywords; displays all variables if not specified}

\item{labels}{whether or not to search variable labels (descriptions); \code{TRUE} by default}

\item{ignore.case}{whether or not to make the keywords case sensitive; 
\code{TRUE} by default (case is ignored during matching)}

\item{details}{add details about each variable (see examples)}
}
\value{
a data frame featuring the variable position, name and description 
(if it exists) in the original data frame
}
\description{
\code{lookfor} emulates the \code{lookfor} Stata command in R. It supports
searching into the variable names of regular R data frames as well as into
SPSS and Stata datasets loaded in R via the \pkg{haven}, 
in which case it will also search variable descriptions (labels).
The command is meant to help users finding variables in large datasets.
}
\details{
The function looks into the variable names for matches to the keywords. If the data frame 
has been imported into R with \pkg{haven} package, then variable labels are included in the search scope.
If \pkg{labelled} package is installed, variable labels of data.frame imported with \pkg{foreign} or
\pkg{memisc} packages will also be taken into account.
}
\examples{
lookfor(iris)
# Look for a single keyword.
lookfor(iris, "petal")
lookfor(iris, "s")
# Look for with a regular expression
lookfor(iris, "petal|species")
lookfor(iris, "s$")
# Look for with several keywords
lookfor(iris, "pet", "sp")
lookfor(iris, "pet", "sp", "width")
# Load memisc package and example data.
\dontrun{require(memisc)
nes1948.por <- UnZip("anes/NES1948.ZIP","NES1948.POR", package="memisc")
nes1948 <- spss.portable.file(nes1948.por)
# Look for a vector of keywords.
lookfor(nes1948, c("Truman", "Dewey"))
# Look for a regular expression.
lookfor(nes1948, "truman|dewey")
# Look for a phrase.
lookfor(nes1948, "personal attribute")}
# Labelled data
data(fecondite)
lookfor(femmes)
lookfor(femmes, "date")
# Display details
lookfor(femmes, details = TRUE)
}
\seealso{
\code{query} in the \code{memisc} package
}
\author{
François Briatte <f.briatte@gmail.com>
}
