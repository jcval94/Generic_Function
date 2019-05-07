tp<-function(n,vec=NULL){
  #variables bien definidas
  if(n!=floor(n) | n<0){warning("n must be a positive integer"); break()}
  if(n==0){return(1); break()}
  if(n==1){return(c(1,1)); break()}

  #Algoritmo
  ifelse(n==2,
         vec<-c(1,1),
         vec<-tp(n-1))

  add<-c()
  for (i in 1:(length(vec)-1)){
    add[i]<-sum(vec[i:(i+1)])
  }
  return(c(1,add,1))
}
