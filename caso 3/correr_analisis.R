setwd("C:/Users/Sarahí/Desktop/UCI HAR Dataset")
xtrain<-read.table("./train/X_train.txt")
xtest<-read.table("./test/X_test.txt")
juntos <- rbind(xtrain, xtest)

rm(xtrain,xtest)

etiquetas<-read.table("features.txt")
colnames(juntos)<-etiquetas[,2]
patron <- c("mean", "std")
njuntos<-subset(juntos, select = grepl(paste(patron, collapse = "|"), 
                                           names(juntos)))
rm(etiquetas,patron,juntos)

colnames(njuntos) <- sub("mean", "Mean", colnames(njuntos))

colnames(njuntos) <- sub("std", "Std", colnames(njuntos))

colnames(njuntos) <- sub("t", "Time", colnames(njuntos))

colnames(njuntos) <- sub("f", "Frequency", colnames(njuntos))

colnames(njuntos) <- sub("BodyBody", "Body", colnames(njuntos))

colnames(njuntos) <- sub("^", "MeanOf", colnames(njuntos))

colnames(njuntos) <- sub("-", "", colnames(njuntos))


acttrain<-read.table("./train/y_train.txt")
acttest<-read.table("./test/y_test.txt")
actividad<-rbind(acttrain,acttest)

rm(acttrain,acttest)

nactividad<-factor(actividad$V1,levels = c(1:6))
levels(nactividad)<-c("WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS",
                      "SITTING","STANDING","LAYING")
njuntos2<-cbind(nactividad,njuntos)

sujetostrain<-read.table("./train/subject_train.txt")
sujetostest<-read.table("./test/subject_test.txt")
sujetos<-rbind(sujetostrain,sujetostest)[,1]
njuntos3<-cbind(sujetos,njuntos2)

library(dplyr)
promedio <- njuntos3 %>% group_by(sujetos, nactividad) %>% summarise_each(funs(mean))
write.table(promedio, row.names= F,file = "ordenada.txt") 
