\name{mGSZ}
\alias{mGSZ}

\title{Gene set analysis based on Gene Set Z-scoring function and asymptotic p-value}
\description{
Gene set analysis based on Gene Set Z scoring function and asymptotic p-value
}
\usage{
mGSZ(x,y,l,f=FALSE,s="T",log=TRUE,g=FALSE,min.sz=5,o=FALSE,pv=0,w1=0.2,w2=0.5,vc=10,p=200)
}

\arguments{
  \item{x}{
Gene expression data matrix (rows as genes and columns as samples)
}
  \item{y}{
Gene set data (dataframe/table/matrix/list)
}
  \item{l}{
Vector of response values (example:1,2)
}
  \item{f}{
TRUE if gene set data is list with genes as list names
}
  \item{s}{
Gene level statistics (example: T-score/FC/P-value)
}
  \item{log}{
TRUE for log fold change as gene level statistics
}
  \item{g}{
TRUE for analysis with both gene and sample permutation data as the null distributions
}
  \item{min.sz}{
Minimum size of gene sets (number of genes in a gene set) to be included in the analysis
}
  \item{o}{
TRUE for gene set analysis with other methods (see the manuscript for details)
}
  \item{pv}{
Estimate of the variance associated with each observation
}
  \item{w1}{
Weight 1, parameter used to calculate the prior variance obtained with class size var.constant. This penalizes especially small classes and small subsets. Default is 0.2. Values around 0.1 - 0.5 are expected to be reasonable.
}
  \item{w2}{
Weight 2, parameter used to calculate the prior variance obtained with the same class size as that of the analyzed class. This penalizes small subsets from the gene list. Default is 0.5. Values around 0.3 and 0.5 are expected to be reasonable
}
  \item{vc}{
Size of the reference class used with wgt1. Default is 10
}
  
  \item{p}{
Number of permutations for p-value calculation
}
}
\details{
A function for Gene set analysis based on Gene Set Z-scoring function and asymptotic p- value. It differs from GSZ (Toronen et al 2009) in that it implements asymptotic p-values instead of empirical p-values. Asymptotic p-values are based on fitting suitable distribution model to the permutation data. Unlike empirical p-values, the resolution of asymptotic p-values are independent of the number of permutations and hence requires consideralbly fewer permutations. In addition to GSZ, this function allows the users to carry out analysis with seven other scoring functions (visit http://ekhidna.biocenter.helsinki.fi/downloads/pashupati/mGSZ.html for a more detailed description) and compare the results.
}
\value{

 \item{mGSZ}{Dataframe with gene sets (in decreasing order based on the significance) reported by mGSZ method and their sizes, scores, p-values and gene set expression summary}
  \item{mGSA}{Dataframe with gene sets (in decreasing order based on the significance) reported by mGSA method and their sizes, scores, p-values and gene set expression summary}
 \item{mAllez}{Dataframe with gene sets (in decreasing order based on the significance) reported by mAllez method and their sizes, scores, p-values and gene set expression summary}
 \item{WRS}{Dataframe with gene sets (in decreasing order based on the significance) reported by WRS method and their sizes, scores, p-values and gene set expression summary}
 \item{SUM}{Dataframe with gene sets (in decreasing order based on the significance) reported by SUM method and their sizes, scores, p-values and gene set expression summary}
 \item{SS}{Dataframe with gene sets (in decreasing order based on the significance) reported by SS method and their sizes, scores, p-values and gene set expression summary}
 \item{KS}{Dataframe with gene sets (in decreasing order based on the significance) reported by KS method and their sizes, scores, p-values and gene set expression summary}
 \item{wKS}{Dataframe with gene sets (in decreasing order based on the significance) reported by wKS method and their sizes, scores, p-values and gene set expression summary}
 \item{sample.labels}{Vector of response values used}
 \item{perm.number}{Number of permutations used for p-value calculation}
 \item{expr.data}{For internal use}
 \item{gene.sets}{For internal use}
 \item{flip.gene.sets}{For internal use}
 \item{min.cl.sz}{For internal use}
 \item{other.methods}{For internal use}
 \item{pre.var}{For internal use}
 \item{wgt1}{For internal use}
 \item{wgt2}{For internal use}
 \item{var.constant}{For internal use}
 \item{start.val}{For internal use}
 \item{select}{For internal use}
 \item{is.log}{For internal use}
 \item{gene.perm.log}{For internal use}
}
\references{
Mishra Pashupati, Toronen Petri, Leino Yrjo, Holm Liisa. Gene Set Analysis: Limitations in popular existing methods and proposed improvements (Not yet published)
http://ekhidna.biocenter.helsinki.fi/downloads/pashupati/mGSZ.html

Toronen, P., Ojala, P. J., Marttinen, P., and Holm, L. (2009). Robust extraction of functional signals from gene set analysis using a generalized threshold free scoring function. BMC Bioinformatics, 10(1), 307.

}
\author{Pashupati Mishra, Petri Toronen}


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

# gene sets in a gmt format can be converted to mGSZ readable format as follows:
# gene.sets <- geneSetsList("gene.sets.gmt")

}
