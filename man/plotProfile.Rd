\name{plotProfile}
\alias{plotProfile}
\title{Plot GSZ scoring function profile}
\description{Plot GSZ scoring function profile}
\usage{
plotProfile(data, rank)
}

\arguments{
  \item{data}{
GSZ profile data 
}
  \item{rank}{
Rank of the gene set for the plot}
}
\details{Once significant gene sets are reported, it is useful to evaluate a gene set in more detail to see the behavior of the gene set. This can be done by visualizing the scoring function profile across the gene list as shown in the GSEA article (Subramanian et al., 2005). It is even more relevant to compare gene set score profile from positive and permuted data. Positive data corresponds to differential gene expression test scores calculated from gene expression data with correct sample labels and permuted data corresponds to differential gene expression test scores calculated from gene expression data with permuted sample labels. This function outputs the visualization that shows the gene set score profile of the analyzed gene set from positive data and a summary of the gene set score profile of the analyzed gene set from permuted data.The plot uses seven percentiles of the gene set score profile of the analyzed gene set from permuted data as a summary.}

\references{
Mishra Pashupati, Toronen Petri, Leino Yrjo, Holm Liisa. Gene Set Analysis: Limitations in popular existing methods and proposed improvements (Not yet published)
http://ekhidna.biocenter.helsinki.fi/downloads/pashupati/mGSZ.html

Subramanian, A., Tamayo, P., Mootha, V. K., Mukherjee, S., Ebert, B. L., Gillette, M. A., Paulovich, A., et al. (2005). Gene set enrichment analysis: a knowledge-based approach for interpreting genome-wide expression profiles. Proceedings of the National Academy of Sciences of the United States of America, 102(43), 15545-15550.

Toronen, P., Ojala, P. J., Marttinen, P., and Holm, L. (2009). Robust extraction of functional signals from gene set analysis using a generalized threshold free scoring function. BMC Bioinformatics, 10(1), 307.

}
\author{Pashupati Mishra, Petri Toronen}

\seealso{\code{\link{StabPlotData}}}

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

# scoring function profile data across the ordered gene list for top 2 gene sets

data4plot <- StabPlotData(mGSZ.obj,rank.vector=c(1,2))

# profile plot for the top gene set

plotProfile(data4plot,1)  


}
