corr<-function(directorio="C:/Users/Sarahí/Documents/specdata",horizonte=0){
  setwd(directorio)
  correla<-numeric()
  micorrelacion<-numeric()
  
  for (s in 1:332){
    data<-read.csv(sprintf("%03g.csv",s))
    completo<-data[complete.cases(data),]
    elementos<-nrow(na.omit(data))
    
    if (elementos>=horizonte){
      
      correla<-cor(completo[2],completo[3])
      micorrelacion<-c(micorrelacion,correla)
    }
  }

  micorrelacion
}