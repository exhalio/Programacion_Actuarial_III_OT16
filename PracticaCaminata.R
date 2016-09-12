s<-0
t<-0

for(i in 1:100){
  z <- 5
  ce<-vector("numeric")
  while (z >= 3 && z <= 10) {
    
    moneda <- rbinom(1,1,0.5) #Genera números aleatorios
    
    if (moneda == 1){#Caminata Aleatoria
      z <- z + 0.5
    } else {
      z <- z - 0.5
    }
    
    ce<-c(z)
    if (ce<3){
      s <- s + 1
    } else { if( ce>10){
      t <- t + 1
    }
    }
  }
}

s #Donde s es "abajo".
t #Donde t es "arriba".