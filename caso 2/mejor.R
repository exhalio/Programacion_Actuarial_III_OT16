mejor <-function(estado, resultado){
    setwd("C:/Users/Sarah�/Documents/Hospitales")
    lectura <- read.csv("outcome-of-care-measures.csv",
                        colClasses = "character")
    estados<-unique(lectura$State)
        if (!estado %in% estados){
            stop("Estado inv�lido.")
        }
    
        if (resultado== "ataque"){
            noutcome<-lectura[c(2,7,11)]
        }else if(resultado== "falla"){
            noutcome<-lectura[c(2,7,17)]
        }else if(resultado=="neumonia"){
            noutcome<-lectura[c(2,7,23)]
        }else{
            stop("Resultado inv�lido.")
        }
        
     outcome<-subset(noutcome,noutcome$State==estado 
                    & !noutcome[[3]]=="Not Available")
    mortal<-outcome[order(as.numeric(outcome[[3]]),outcome[[1]]),]
    hospital<-mortal[1,1]
    hospital
}