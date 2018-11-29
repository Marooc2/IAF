# 1) De la ferretería se compran total de 135 desatornilladores, se aluden a su longitud (largo y cortos) y su forma (planos o de estrella) teniendo la distribución

print('EJERCICIOS 1')

Prob = function(Vec)
{
  return(sum(Vec$Probs))
}
Union = function(A,B)
{
  return(rbind(A,B))
}

Interseccion = function(A,B)
{
  T1 = length(A$A)
  T2 = length(B$A)
  R = NULL
  for(i in 1:T1) 
    for(j in 1:T2)
      if(A$A[i]==B$A[j] & A$B[i]==B$B[j] )
        R = rbind(R,A[i,])
  return(R)
}
Condicional = function(A,B)
{
  return(Prob(Interseccion(A,B))/Prob(B))  
}

E <- expand.grid(A=c('Largo','Corto'),B=c('Plana','Estrella'))
Cant <- c(40,60,15,20)
E <- data.frame(E,Cant)
E <- data.frame(E,Probs=rep(0,4))
for(i in 1:4) 
{
  E$Probs[i]=E$Cant[i]/sum(E$Cant)
}
Largo=subset(E,A=='Largo')
Corto=subset(E,A=='Corto')
Plana=subset(E,B=='Plana')
Estrella=subset(E,B=='Estrella')

# Probabilidades marginales
cat('Probabilidad marginal Largo:',Prob(Largo),'\n')
cat('Probabilidad marginal Corto: ',Prob(Corto),'\n')
cat('Probabilidad marginal Plana:',Prob(Plana),'\n')
cat('Probabilidad marginal Estrella:',Prob(Estrella),'\n')

# Probabilidades condicionales
cat('Probabilidad Largo dado Plana ',Condicional(Largo, Plana),'\n')
cat('Probabilidad Largo dado Estrella ',Condicional(Largo, Estrella),'\n')
cat('Probabilidad Corto dado Plana ',Condicional(Corto, Plana),'\n')
cat('Probabilidad Corto dado Estrella ',Condicional(Corto, Estrella),'\n')

cat('Probabilidad Plana dado Largo ',Condicional(Plana, Largo),'\n')
cat('Probabilidad Plana dado Estrella ',Condicional(Plana, Corto),'\n')
cat('Probabilidad Plana dado Largo ',Condicional(Estrella, Largo),'\n')
cat('Probabilidad Plana dado Estrella ',Condicional(Estrella, Corto),'\n')


# Prueba de independencia
if(Condicional(Largo,Plana)==Prob(Largo))
{
  cat('Largo y Plana son Independientes \n')
} else
{
  cat('Largo y Plana son Dependiente\n')
}

if(Condicional(Largo,Estrella)==Prob(Largo))
{
  cat('Largo y Estrella son Independientes\n')
} else
  
{
  cat('Largo y Estrella son Dependiente\n')
}

# Prueba de independencia
if(Condicional(Corto,Plana)==Prob(Corto))
{
  cat('Corto y Plana son Independientes\n')
} else
{
  cat('Corto y Plana son Dependiente\n')
}

if(Condicional(Corto,Estrella)==Prob(Corto))
{
  cat('Corto y Estrella son Independientes\n')
} else
{
  cat('Corto y Estrella son Dependiente\n')
}




# Prueba de independencia
if(Condicional(Plana,Largo)==Prob(Plana))
{
  cat('Plana y Largo son Independientes\n')
} else
{
  cat('Plana y Largo son Dependiente\n')
}

if(Condicional(Plana,Corto)==Prob(Plana))
{
  cat('Plana y Corto son Independientes\n')
} else
{
  cat('Plana y Corto son Dependiente\n')
}

# Prueba de independencia
if(Condicional(Estrella,Largo)==Prob(Estrella))
{
  cat('Estrella y Largo son Independientes\n')
} else
{
  cat('Estrella y Largo son Dependiente\n')
}

if(Condicional(Estrella,Corto)==Prob(Estrella))
{
  cat('Estrella y Corto son Independientes\n')
} else
{
  cat('Estrella y Corto son Dependiente\n')
}
