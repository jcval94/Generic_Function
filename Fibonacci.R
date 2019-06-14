#Aquí la importancia de generalizar el código
#Fibonacci
#Tribonacci
#N...bonacci

#veamos cómo aproximar Fibbonaci
#los primeros n términos y función de convergencia
Fibo<-function(n){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n==1){
    return(1)
  }else{
    a<-Fibo(n-1)
    #print(a)
    #b<-unlist(a)
    return((a+n))
  }
}
#El tercer término
Fibo(3)
#Los primeros 5 términos
purrr::map(1:5,Fibo)

#Sumar los dos números anteriores dde la suc.
Tribo<-function(n){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n<3){
    return(1)
  }else{
    
    #Tribo(n-1)+Tribo(n-2)
    #==
    #sum(Tribo(n-1),Tribo(n-2))
    #==
    a<-sum(purrr::map_dbl((n-2):(n-1),Tribo))
    #b<-unlist(a)
    return((a))
  }
}
#El quinto término
Tribo(5)
A<-purrr::map_dbl(1:9,Tribo)
A


N_bo<-function(n,bonacci=2){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n<bonacci){
    return(1)
  }else{
    #Análogamente  a Tribo
    
    #N_bo(n-1)+N_bo(n-2)+...
    #==
    #sum(N_bo(n-1),N_bo(n-2),...)
    #==
    #a<-sum(purrr::map_dbl((n-2):...,N_bo))
    #==
    #Si en Fibonacci debo evaluar n-1 y en Tribo n-1 y n-2
    #Entonces debo evaluar desde n-1 hasta n-bonacci
    #a<-sum(purrr::map_dbl((n-2):...,~N_bo(.x,bonacci)))
    #==
    #quí es necesario separarlo en el caso Fibonacci y en los Nbonacci
    if(bonacci==2){
      a<-sum(purrr::map_dbl(n-1,~N_bo(.x,bonacci)))+n
    }else{
      a<-sum(purrr::map_dbl((n-1):(n-bonacci+1),~N_bo(.x,bonacci)))
    }
    return(a)
  }
}

#Fibonacci
purrr::map_dbl(1:9,~N_bo(.x,2))
purrr::map_dbl(1:9,Fibo)

#Tribo
purrr::map_dbl(1:9,~N_bo(.x,3))
purrr::map_dbl(1:9,Tribo)

#Cuatri
purrr::map_dbl(1:9,~N_bo(.x,4))


#Legó el momento de enloquecer...
