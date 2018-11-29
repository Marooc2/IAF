#install.packages("bnlearn")
library(bnlearn)

Grafo = empty.graph(c("X","Y1"))
Matriz = matrix(0,ncol=2,nrow = 2,dimnames = list(c("X","Y1"),c("X","Y1")))
Matriz["X","Y1"]=1
amat(Grafo)=Matriz
Resp = c("si","no")
X = matrix(c(0.003,0.997),ncol = 2, dimnames = list("Probs",Resp))
Y1= matrix(c(0.992,0.008,0.0006,0.994),ncol = 2,nrow = 2,dimnames = list("Y1"=Resp,"X"=Resp))

Distribucion= custom.fit(Grafo, dist = list(X=X,Y1=Y1))

#P(+x|+y1)
cpquery(Distribucion,X=="si",Y1=="si")
