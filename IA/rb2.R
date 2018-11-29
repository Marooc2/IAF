C <- expand.grid(ciudad=c('Lima','Arequipa','Trujillo'))
Probs = c(0.45,0.3,0.25)
Defectuoso = c(0.05,0.03,0.04)
S = data.frame(C,Probs,Defectuoso)
S

##a
InterseccionCondicional = function(Vec,c)
{
  #probabilidad que sea defectuoso sabiendo que es de la ciudad c
  p1 = sum(subset(Vec, ciudad==c, select=Defectuoso))
  #probabilidad que sea de la ciudad c
  p2 = sum(subset(Vec, ciudad==c, select=Probs))
  return(p1 * p2)
}

i[1]<-InterseccionCondicional(S,"Lima")
i[2]<-InterseccionCondicional(S,"Arequipa")
i[3]<-InterseccionCondicional(S,"Trujillo")

sum(i)
#b
Bayes = function(Vec,c,d)
{
  #probabilidad de que sea defectuoso sabiendo que es de la ciudad c
  p1 = sum(subset(Vec, ciudad==c, select=Defectuoso))
  #probabilidad de que sea de la ciudad 
  p2 = sum(subset(Vec, ciudad==c, select=Probs))
  #
  return(p1 * p2/d)
}
Bayes(S,"Trujillo",sum(i))
Bayes(S,"Lima",sum(i))
