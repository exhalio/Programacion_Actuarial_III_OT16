completos<-function(directorio="C:/Users/Sarahí/Documents/specdata",id=1:332){
  setwd(directorio)
  nobs<-numeric()
  for (s in id){
    data<-read.csv(sprintf("%03g.csv",s))
    nobs<-c(nobs,nrow(na.omit(data)))
  }
  tabla<-data.frame(id,nobs)
  tabla
}
