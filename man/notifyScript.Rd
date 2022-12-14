% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/notifyScript.R
\name{notifyScript}
\alias{notifyScript}
\title{Print a notification of a script's conclusion in the console}
\usage{
notifyScript(prefix = "Done:", scriptName = NULL)
}
\arguments{
\item{prefix}{A string of text to print before the script name; default is "Done:"}

\item{scriptName}{A character string of length 1; if not supplied function will search for \code{scriptName} object in the global environment}
}
\value{
Printed notification text
}
\description{
This function is an extension of the \code{notify} function.
}
\examples{
scriptName <- "environment_script.R"
notifyScript()
notifyScript(scriptName = "specified_script.R")
}
