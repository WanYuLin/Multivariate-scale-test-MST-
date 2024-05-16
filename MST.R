
# Author: Wan-Yu Lin, Professor, Institute of Health Data Analytics and Statistics, National Taiwan University


MST1 <- function(Traits, Covariate, SNP){
    residu   <- residuals(lm(as.matrix(Traits) ~ as.factor(SNP) + as.matrix(Covariate), na.action = na.exclude))
    for(k in 1:ncol(residu)){
        tmp <- which((residu[,k]>mean(residu[,k],na.rm=T)+5*sd(residu[,k],na.rm=T)) | (residu[,k]<mean(residu[,k],na.rm=T)-5*sd(residu[,k],na.rm=T)))
        residu[tmp,k] <- NA
        }              
    dis <- apply(residu,2,function(x){(x-median(x,na.rm=T))^2})
    H1.model <- manova(dis ~ as.factor(SNP))
    H0.model <- manova(dis ~ 1)
    p.value <- matrix(NA,1, (ncol(Traits)+1))
    p.value[1,1] <- anova(H1.model, H0.model, test = "Pillai")[2, "Pr(>F)"]
    p.value[1,2:ncol(p.value)] <- apply(dis,2,function(x){unlist(summary(aov(x ~ as.factor(SNP))))["Pr(>F)1"]}) 
    return(p.value)
}
                                 
MST <- function(Traits, Covariate, SNP){result <- apply(SNP, 2, function(x){MST1(Traits, Covariate, x)}); rownames(result) <- c("MST",paste0("UST",1:ncol(Traits))); return(result)}


