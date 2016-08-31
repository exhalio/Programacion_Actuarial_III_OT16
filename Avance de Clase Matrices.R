#Clase del 25/08/2016

#vector:elementos de la misma clase
#Crear vectores

x <- vector(mode="numeric",length = 5L)
x

#Crear vectores con la función c

x <- c(0.5,0.6)
x
class(x)

x<- c(TRUE,FALSE,T,F)
x
class(x)

x<-5:10
x
class(x)

x<-10:0
x
class(x)

x<- c(1+2i,5,3+9i,-4-5i)
x
class(x)

x<-c("a","b","c","d")
x
class(x)

#Mezcla objetos en un vector

y<- c(1.7,"a") #caracter
y<- c(TRUE,2) #numerico
y<-c("a",TRUE) #caracter

y<-c(TRUE,10L,8.5,1+1i,"Nacho")
y
class(y)

# Orden de coacción/coerción explicita
#1. character
#2. complex
#3. numeric
#4. integer 
#5. logical

#coacción; r vuelve a todas las variables del mismo tipo dependiendo 
#de que tipo domina. 

#Coerción explícita
z<-0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z<-c(1+2i,3+4i,8,0+3i,0)
class(z)
as.logical(z)

z<-c("Programación","Actuarial")
as.numeric(z)

#Las listas almacenan cada elemento con su propia clase. 
#Lista:colección de vectores.
#LISTAS

x <-list(1,"b",FALSE,3+5i)
class(x)
#Con c, se crea el vector más conveniente. 

#MATRICES
#Matriz:generalización de un vector.
#dim=dimensión

m<-matrix(nrow=2,ncol=3)
m
dim(m)

#Cambio de dimensiones de 2x3 a 3x2
attributes(m)
dim(m)<- c(3,2)
m

#Crear una matriz con datos. 
m<-matrix(1:6,3,2)
m

m<-matrix(1:6,3,2,T)
m

m<-matrix(1:6,3,3,T)
m
class(m)
str(m)

dim(m)<-c(2,5) #error

x<-c(1,2,3)
y<-c("a","b","c")
z<-c(x,y)
z

m1<-rbind(m,x)
m1

m2<-cbind(m,x)
m2

m1<-rbind(m1,y)
m1

m2<-cbind(m2,y)
m2

#Factores 
x<- factor(c("si","no","si","si","no","si","no"))
x
table(x) #realiza el conteo
x
unclass(x)
x

x<-factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)
x

#Valores faltantes 
x<-c(1,2,NA,10,3)
x
is.na(x)
is.nan(x)

x<-c(1,2,NaN,10,3)
x
is.na(x)
is.nan(x)

#Data Frame

x<-data.frame(Erick=1:4,Lori=c(T,T,F,F))
row.names(x)<-c("Primero","Segundo","Tercero","Cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x)<-c("Yarely","Karen")
x

#Los nombres no son exclusivos de los data frames 
x<-1:3
names(x) #NULL
names(x)<-c("Hugo","Paco","Luis")
x

x<-list(a=1:10,b=100:91,c=51:60)
x

names(x)<-c("Seq1","Seq2","Seq3")
x

m<- matrix(1:4,2,2)
m
attributes(m)
dimnames(m)<-list(c("fill1","fill2"),c("Coll1","Col2"))
m

m<-matrix(NA,5,5)
attributes(m)
m
dimnames(m)<-list(c(1:5),c("A","B","C","D","E"))
m
#Lectura de Datos 
getwd()
data<-read.csv("Datos-SP.csv")
data<-read.table("Datos-SP.csv",T,",")
data













