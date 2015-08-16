# Requires plotrix library and split.file() output files.
# See Burton-Kelly (2008) for complete documentation.
confplotv <- function(path, pattern, vardis="Variation", smoo=c(1:20), reps=1000, ext="-confplotv.txt", probs=c(0.025,0.975))
    {
    files<-list.files(path=path,pattern=pattern,full.names=TRUE);
    for(i in files)
        #Loop through files and assign variable names
        {
        x <- read.table(i,header=TRUE,row.names=1);
        assign(i, x);
        }
    for(j in 1:length(files))
        {
        SOV <- get(files[j]);
        bootSOV <- numeric(reps); #creates place for bootstrap values
        for (k in 1:reps) {bootSOV[k] <- sum(diag(var(sample(SOV,replace=TRUE))))};
        conf<-quantile(bootSOV,probs=probs);
        toplot<-paste(smoo[j],mean(bootSOV),conf[2],conf[1]);
        write.table(toplot,file=paste(substring(files[1],1, nchar(files[1])-4), ext, sep=""),quote=FALSE,append=TRUE, row.names=FALSE, col.names=FALSE)
        }
    tableback<-read.table(file=paste(substring(files[1],1,nchar(files[1])-4), ext, sep=""));
    x<-unlist(tableback[1]);
    y<-unlist(tableback[2]);
    cui<-unlist(tableback[3]);
    cli<-unlist(tableback[4]);
    plotCI(x,y,ui=cui,li=cli,xlab=c("Smoothing"),ylab=vardis, ylim=c(0,0.025));
    pdf(paste(substring(files[1],1,nchar(files[1])-4), ext, c(".pdf"), sep=""));
    plotCI(x,y,ui=cui,li=cli,xlab=c("Smoothing"),ylab=vardis, ylim=c(0,0.025));
    dev.off();
    }

