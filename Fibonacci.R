#Fibonacci
#Tribonacci
#N...bonacci

#veamos cómo aproximar Fibbonaci
#los primeros n términos y función de convergencia
Recu<-function(n){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n==1){
    return(1)
  }else{
    a<-Recu(n-1)
    #print(a)
    #b<-unlist(a)
    return((a+n))
  }
}
#El tercer término
Recu(3)
#Los primeros 5 términos
purrr::map(1:5,Recu)

#Sumar los dos números anteriores dde la suc.
Fibo<-function(n){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n<3){
    return(1)
  }else{
    
    #Fibo(n-1)+Fibo(n-2)
    #==
    #sum(Fibo(n-1),Fibo(n-2))
    #==
    a<-sum(purrr::map_dbl((n-2):(n-1),Fibo))
    #b<-unlist(a)
    return((a))
  }
}
#El quinto término
Fibo(5)
A<-purrr::map_dbl(1:9,Fibo)
A


N_bo<-function(n,bonacci=2){
  if(n-floor(n)!=0){warning("Must be integer")
    return(invisible())}
  if(n<bonacci){
    return(1)
  }else{
    #Análogamente  a Fibo
    
    #N_bo(n-1)+N_bo(n-2)+...
    #==
    #sum(N_bo(n-1),N_bo(n-2),...)
    #==
    #a<-sum(purrr::map_dbl((n-2):...,N_bo))
    #==
    #Si en Fibonacci debo evaluar n-1 y en Fibo n-1 y n-2
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

#Suc. Fibonacci
purrr::map_dbl(1:9,~N_bo(.x,3))
purrr::map_dbl(1:9,Fibo)

#Obtengamos el número de oro
#Aproximaión
Fibo(19)/Fibo(20)

#Tribonacci
Tr<-purrr::map_dbl(1:16,~N_bo(.x,4))
Tr
#Aproximaión
Tr[length(Tr)-1]/Tr[length(Tr)]

#Cuatribonacci
Cr<-purrr::map_dbl(1:16,~N_bo(.x,5))
Cr
#Aproximaión
Cr[length(Cr)-1]/Cr[length(Cr)]


#Legó el momento de enloquecer...
#Diezbonacci
Db<-purrr::map_dbl(1:24,~N_bo(.x,11))
Db
#Aproximaión
Db[length(Db)-1]/Db[length(Db)]
#Parece que a mayor número de dimensiones más nos acercamos a 1/2

#Sé que no existe ninguna relación demostrable pero...
#El número de Fibonacci lo vemos en la naturanleza en un universo que
#percibimos como tridimencional

#Planteo la siguiente hipótesis:
#El número de oro depende de la dimensión

#En un universo que puede ser percibido en 4 dimensiones
#El número de Tribonacci es el que gobierna.

#Pregunta que parece difícil...
#Supongamos que la hipótesis se cumple

#Qué pasaría en un universo de infinitas dimensiones?

#La serie que obtendríamos sería
#1,1,1,1,1,1,... todos unos absolutamente

#Y si aplicamos la convergencia obtendremos...
#1/1 que es el 1... WTF!!!!!!

#Nota:
#Es increíble que de una operación que en infinito parece converger a 1/2
#En realidad converga a 1.

#Nota 2: soy consciente que la hipótesis de las dimensiones es una locura
#Para un universo en 2 dimensiones se tendría que sumar a si mismo
#Si empezamos en 1, obtendremos que converge a pi^2/6 (Gracias Euler)

#También sé que el algoritmo es muy mejorable, es sólo a modo de ejemplificar
#Es por eso que las cosas se deben demostrar, pero es un buen ejemplo
#para dudar de todo lo que parece tener 1/2 como respuesta
#Incluida la Hipo de Riemann

