# Requires function cbind.all(). Single-column input files without column or row names.
# See Burton-Kelly (2008) for complete documentation.

euc.group <- function(path,pattern,ext="-eucgroup.euc",len=11)
 {
 file.list <- list.files(path=path,pattern=pattern,full.names=TRUE);
#List files that match pattern.
 for(i in file.list)
 #Loop through files and assign variable names
{
                 x <- read.table(i);
                 assign(i, x);
  }
 output <- cbind.all(get(file.list[1]));  #Initiate output
 for (j in 2:length(file.list))
 #Dump everything into that array
  {
  output <- cbind.all(output, get(file.list[j]));
  }
 write(t(as.matrix(output)),file=paste(substring(file.list[1],1, nchar(file.list[1])-4), ext, sep=""), ncolumns=dim(output)[2],sep="\t");
 return(output);
}