PvsNP<-function(A,n=0){
  #la suma es 0?
  A<-c(-1,-5,-8,4,2,3,32,21,-166,17,55,9,33,-19,-7,120,425,-222)
  #Primera cond
  if(sum(A[A<0])>n | sum(A[A>0])<n){return(F)}
  A<-sort(A-n)
  OrdenM<-nchar(max(A))
  #
  M0<-abs(A[A<0])
  M1<-A[A>0]

  bye<-sum(M0 %in% M1)>1
  if(bye){return(T)}
  if(length(M0)==0 | length(M1)==0){return(F)}

  M1<-M1[M1<sum(M0)]
  M0<-M0[M0<sum(M1)]

  length(M0)->lm2
  length(M1)->lm1
  #segunda cond
  for (i in 1:length(M0)) {
    N1<-M0[i]
    cond<-M1<floor(N1/2)
    M1[M1[!cond] %in% (N1-M1[cond])]
  }
}
