rankhospital<-function(estado,resultado,num="mejor"){
    setwd("C:/Users/Sarahí/Documents/Hospitales")
    lectura <- read.csv("outcome-of-care-measures.csv",
                        colClasses = "character")
    estados<-unique(lectura$State)
        if (!estado %in% estados){
            stop("Estado inválido.")
        }
    
        if (resultado== "ataque"){
            noutcome<-lectura[c(2,7,11)]
        }else if(resultado== "falla"){
            noutcome<-lectura[c(2,7,17)]
        }else if(resultado=="neumonia"){
            noutcome<-lectura[c(2,7,23)]
        }else{
            stop("Resultado inválido.")
        }
        
    outcome<-subset(noutcome,noutcome$State==estado
                    & !noutcome[[3]]=="Not Available") 
    rank<-outcome[order(as.numeric(outcome[[3]]),outcome[[1]]),]
    
        if (num=="peor"){
            mortal<- rank[order(as.numeric(rank[[3]]),decreasing = T),]
            phospital<-mortal[1,1]
            phospital
        }else if(num=="mejor"){
            print(rank[1,1])
        }else{
            hospital<-rank[num,1]
            hospital  
        }
}