rankhospitalcompleto<-function(resultado,num="mejor"){
    setwd("C:/Users/Sarahí/Documents/Hospitales")
    lectura <- read.csv("outcome-of-care-measures.csv",
                        colClasses = "character")
    
    estados<-sort(unique(lectura$State))
    listah<-as.character()
    estadito<-as.character()
    
    if (resultado== "ataque"){
        noutcome<-lectura[c(2,7,11)]
    }else if(resultado== "falla"){
        noutcome<-lectura[c(2,7,17)]
    }else if(resultado=="neumonia"){
        noutcome<-lectura[c(2,7,23)]
    }else{
        stop("Resultado inválido.")
    }
    
    for (estado in estados){
        outcome<-subset(noutcome,noutcome$State==estado
                    & !noutcome[[3]]=="Not Available") 
        rank<-outcome[order(as.numeric(outcome[[3]]),outcome[[1]]),]
        
        if (num=="peor"){
            mortal<-rank[which.max(rank[[3]]),]
            phospital<-mortal$Hospital.Name
            listah<-c(listah,phospital)
        }else if(num=="mejor"){
            mhospital<-rank[1,1]
            listah<-c(listah,mhospital)
        }else{
            xhospital<-rank[num,1]
            listah<-c(listah,xhospital)  
        }
    estadito<-c(estadito,estado)
    }
    tabla<-data.frame("Hospital"=listah,"Estado"=estadito)
    tabla
}