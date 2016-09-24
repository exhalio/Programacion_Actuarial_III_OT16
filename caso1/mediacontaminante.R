
mediacontaminante<-function(directorio="C:/Users/Sarahí/Documents/specdata",contaminante="sulfate",id=1:332){
  setwd(directorio)
  sumatotal<-0
  completostotal<-0
  
  for (s in id){
    data<-read.csv(sprintf("%03g.csv",s))
    
    if(contaminante=="sulfate"){
      elementos<-nrow(na.omit(data[2]))
      sumacontam<-sum(data$sulfate,na.rm=TRUE)
    }else{
      elementos<-nrow(na.omit(data[3]))
      sumacontam<-sum(data$nitrate,na.rm=TRUE)
    }
    sumatotal<-sumatotal+sumacontam 
    completostotal<-completostotal+elementos
  }
  
  media<-sumatotal/completostotal
  media
  
}
