mejor <-function(estado, resultado){
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
    mortal<-outcome[which.min(outcome[[3]]),]
    hospital<-mortal$Hospital.Name
    hospital
}