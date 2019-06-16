#Planteamiento y solución con 4 líneas

puntos<-expand.grid(0:2,0:2)

plot(puntos,xlim=c(0,3),ylim=c(0,3))

abline(v = 0)
abline(h = 0)
abline(a = 3,b=-1)
abline(a = 0,b = 1)

#Resolveremos el problema con tres líneas
install.packages("rgl")
install.packages("digest")

library(rgl)
#Usaremos geometría no euclidiana
spheres3d(0,0,0,lit=FALSE,color="white")
spheres3d(0,0,0,radius=1.01,lit=FALSE,color="grey",front="lines")

theta <- c(0,pi,2*pi,1/2*pi,-1/2*pi)
u <- c(-1,0,1,0,0)
x <- sqrt(1-u^2)*cos(theta)
y <- sqrt(1-u^2)*sin(theta)
z <- u

spheres3d(x,y,z,col="blue",radius=0.04)

#Adición de las "líneas"
n<-54
theta <- runif(n,pi/2,pi*3/2)
u <- rep(c(0),n)

x <- sqrt(1-u^2)*cos(theta)
y <- sqrt(1-u^2)*sin(theta)
z <- u

spheres3d(x,y,z,col="red",radius=0.02)


n<-54
theta <- seq(pi/2,pi*2,n)
u <- seq(-1,1,length.out=n)

x <- sqrt(1-u^2)*cos(theta)
y <- sqrt(1-u^2)*sin(theta)
z <- u

spheres3d(x,y,z,col="red",radius=0.02)
spheres3d(-x,-y,z,col="red",radius=0.02)

#Möbius Strip
#Instalamos los paquetes necesarios
install.packages("geozoo")
install.packages("tourr")
#Cargamos librerías
library(geozoo)
library(tourr)

#Ejecutar mobius
Mob<-mobius(3,200)
#Matriz de puntos en 3D
Mob[[1]]

#Añadimos los 9 puntos del problema

#Resolveremos el problema con 1 línea

#Cuando lo resolvimos con 3 lineas, se abrió la siguiente discusión:

set.seed(101)
n <- 9
#Vemos una combinación de dist unif para la posición en la esfera
theta <- runif(n,0,2*pi)
u <- runif(n,-1,1)

#Y si cambiamos la dist??...

theta <- runif(n,0,2*pi)
u <- runif(n,-1,1)

x <- sqrt(1-u^2)*cos(theta)
y <- sqrt(1-u^2)*sin(theta)
z <- u

spheres3d(x,y,z,col="blue",radius=0.04)

#Y si usaramos este método para estudiar un brote empidémico a gran escala...


#O para modelar una tormenta...

#O distribución poblacional con foco en las ciudades


#CONTINUARÁ?...
