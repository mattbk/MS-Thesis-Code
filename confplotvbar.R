# Requires gplots, gregmisc package. split.file() output files.
# See Burton-Kelly (2008) for complete documentation.
confplotvbar<-function(path, pattern, vardis="Variation", barnames=c(1:20),xlabel="Genus", reps=1000, ext="-confplotvbar.txt", probs=c(0.025,0.975))
    {
    require(gplots);
    files<-list.files(path=path,pattern=pattern,full.names=TRUE);
    for(i in files)
        #Loop through files and assign variable names [This is not necessary]
        {
        x <- read.table(i,header=TRUE);
        assign(i, x);
        }
    for(j in 1:length(files))
        {
        SOV <- get(files[j]);
        bootSOV <- numeric(reps);
        #creates place for bootstrap values
        for (k in 1:reps) {bootSOV[k] <- sum(diag(var(sample(SOV, replace=TRUE))))}; 
        conf<-quantile(bootSOV,probs=probs);
        toplot<-paste(barnames[j],mean(bootSOV), conf[2],conf[1],files[j]);
        write.table(toplot,file=paste(substring(files[1],1, nchar(files[1])-4), ext, sep=""),quote=FALSE,append=TRUE, row.names=FALSE,col.names=FALSE)
        }
    tableback<-read.table(file=paste(substring(files[1],1, nchar(files[1])-4), ext, sep=""));
    x<-unlist(tableback[1]);
    y<-unlist(tableback[2]);
    cui<-unlist(tableback[3]);
    cli<-unlist(tableback[4]);
    barplot2(height=y,names.arg=x,xlab=xlabel, ylab=vardis,ci.l=cli,ci.u=cui,plot.ci=TRUE);
    pdf(paste(substring(files[1],1,nchar(files[1])-4), ext, c(".pdf"), sep=""));
    barplot2(height=y,names.arg=x,xlab=xlabel,ylab=vardis,ci.l=cli,ci.u=cui,plot.ci=TRUE);
    dev.off();
    file.rename(paste(substring(files[1],1,nchar(files[1])-4), ext, sep=""),paste(path,"/confplotvbar-",pattern,".txt",sep=""));
    file.rename(paste(substring(files[1],1,nchar(files[1])-4), ext, c(".pdf"), sep=""),paste(path,"/confplotvbar-", pattern,".pdf",sep=""));
    # If using OS X, can announce when done
    # system("say All done!");
    }