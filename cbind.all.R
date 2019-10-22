# C.3.1 cbind.all
# C.3.1.1 Summary
# Written by Dorai-Raj (2005). Does the same thing as cbind(), but will join lists
of unequal lengths. Function is used in euc.group().
# Dorai-Raj, S. (2005). [R] R: cbind from Sundar Dorai-Raj on 2005-08-08 (2005-
# August.txt). http://nzi.psych.upenn.edu/R/Rhelp02a/archive/59302.html. Accessed
# 10 November 2008.
# C.3.1.2 Requirements
# None.
# C.3.1.3 User Input
# A list of column vectors (which can be dierent lengths) is required as arguments.
# C.3.1.4 Output
# Output is a data matrix containing the columns entered, arranged side by side.

cbind.all <- function(..., fill.with = NA) {
args <- list(...)
len <- sapply(args, NROW)
if(diff(rng <- range(len)) > 0) {
maxlen <- rng[2]
pad <- function(x, n) c(x, rep(fill.with, n))
for(j in seq(along = args)) {
if(maxlen == len[j]) next
if(is.data.frame(args[[j]])) {
args[[j]] <- lapply(args[[j]], pad, maxlen - len[j])
args[[j]] <- as.data.frame(args[[j]])
} else if(is.matrix(args[[j]])) {
args[[j]] <- apply(args[[j]], 2, pad, maxlen - len[j])
} else if(is.vector(args[[j]])) {
args[[j]] <- pad(args[[j]], maxlen - len[j])
} else {
stop("... must only contain data.frames or arrays.")
}
}
}
