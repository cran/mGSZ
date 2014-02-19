\name{toTable}
\alias{toTable}

\title{Table with top gene sets}
\description{Table with top gene sets}
\usage{
toTable(mGSZobj,sample=FALSE,m=c("mGSZ","mGSA","mAllez","WRS","SS","SUM","KS","wKS"),n=5)
}

\arguments{
  \item{mGSZobj}{
mGSZ object
}

  \item{sample}{
TRUE for table of top gene sets based on sample permutation when both gene and sample permutations were used.
}

  \item{m}{
Method for which table for top gene sets is required (Required only when other methods were used for the gene set analysis)
}
  \item{n}{
Number of top gene sets in the table
}
}

\value{
A table with top gene sets
}
\references{
Mishra Pashupati, Toronen Petri, Leino Yrjo, Holm Liisa. Gene Set Analysis: Limitations in popular existing methods and proposed improvements (Not yet published)
http://ekhidna.biocenter.helsinki.fi/downloads/pashupati/mGSZ.html
}
\author{Pashupati Mishra, Petri Toronen}

\seealso{\code{\link{mGSZ}}}
\examples{
gene.names <- paste("g",1:100, sep = "")

# create random gene expression data matrix

set.seed(100)
x <- matrix(rnorm(100*10),ncol=10)
rownames(x) <- gene.names
b <- matrix(2*rnorm(50),ncol=5)
ind <- sample(1:10,replace=FALSE)
x[ind,6:10] <- x[ind,6:10] + b

l <- rep(1:2,c(5,5))

# create random gene sets

y <- vector("list", 20)
for(i in 1:length(y)){
	y[[i]] <- sample(gene.names, size = 10)
}
names(y) <- paste("set", as.character(1:20), sep="")

mGSZ.obj <- mGSZ(x, y, l, p = 100)
top.mGSZ.sets <- toTable(mGSZ.obj, n = 10) 

}
