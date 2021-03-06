\name{create_stata_dta}
\alias{create_stata_dta}
\title{Process a list of data.frames from processVISION into .dta files for
Stata}
\usage{
create_stata_dta(df.list, outdir = ".", date = NULL, lower.names = FALSE,
  tryConvert = TRUE, version = 11L, convert.dates = TRUE,
  convert.factors = "string", verbose = TRUE, trunc32 = FALSE, ...)
}
\arguments{
  \item{df.list}{list of data frames from
  \code{\link{processVISION}}}

  \item{outdir}{directory to put Stata .dta files (default
  ".")}

  \item{date}{(character, default NULL) date of export, to
  be added to names of datasets}

  \item{tryConvert}{(logical, default TRUE) should the
  function try to make Date and numeric columns (TRUE) or
  just leave the data.frame as is (FALSE)?}

  \item{lower.names}{(logical, default FALSE) should the
  column names for each variable be lowercase?}

  \item{version}{(integer, default 11L) version of Stata to
  create, passed to \code{\link{write.dta}}}

  \item{convert.dates}{(logical, default TRUE) convert the
  dates to Stata dates? see \code{\link{write.dta}}}

  \item{convert.factors}{(character, default "string") how
  to handle factors, see \code{\link{write.dta}}}

  \item{verbose}{(logical, default TRUE) should names be
  printed for checking the progress?}

  \item{trunc32}{Truncate variables with > 32 characters?}

  \item{...}{Additional arguments to be passed to
  \code{\link{write32.dta}}}
}
\value{
data.frame with 2 columns: the dataset name and an
indicator if that dataset was converted.
}
\description{
Processes a list of data.frames and uses
\code{\link{write32.dta}} to create Stata data sets,
converting factor and character vectors of each column of
each dataset
}
\examples{
\dontrun{
xmlfile = "MISTIE_III_Subjects_2014_01_09.xml"
df <- processVISION(xmlfile, isXML=FALSE,
drop.pattern=c("^i_Doc_.*", "^docs_.*"),
drop.new=TRUE)
df.list <- df$df.list
check <- create_stata_dta(df.list, outdir=datadir)
}
}
\seealso{
\code{\link{write32.dta}}, \code{\link{write.dta}},
\code{\link{processVISION}}
}

