########################Compare change in proportions 
#HISTORIC VS CURRENT
VUMA.H.Krat<-c(225,327)
VUMA.C.Krat<-c(38,60)
VUMA.H.Rodents<-c(140,412)
VUMA.C.Rodents<-c(33,65)
VUMA.H.Leporids<-c(69,483)
VUMA.C.Leporids<-c(10,88)
VUMA.H.Insects<-c(118,434)
VUMA.C.Insects<-c(23,75)

CALA.H.Insects<-c(307,824)
CALA.C.Insects<-c(136,227)
CALA.H.Leporids<-c(776,355)
CALA.C.Leporids<-c(49,314)
CALA.H.Rodents<-c(393,738)
CALA.C.Rodents<-c(116,247)
CALA.H.Krat<-c(606,525)
CALA.C.Krat<-c(118,245)

VUMA.Krat<-rbind(VUMA.H.Krat,VUMA.C.Krat)
rownames(VUMA.Krat)<-c("H", "C"); colnames(VUMA.Krat)<-c("S","F")

VUMA.Rodents<-rbind(VUMA.H.Rodents,VUMA.C.Rodents)
rownames(VUMA.Rodents)<-c("H", "C"); colnames(VUMA.Rodents)<-c("S","F")

VUMA.Leporids<-rbind(VUMA.H.Leporids,VUMA.C.Leporids)
rownames(VUMA.Leporids)<-c("H", "C"); colnames(VUMA.Leporids)<-c("S","F")

VUMA.Insects<-rbind(VUMA.H.Insects,VUMA.C.Insects)
rownames(VUMA.Insects)<-c("H", "C"); colnames(VUMA.Insects)<-c("S","F")


CALA.Insects<-rbind(CALA.H.Insects,CALA.C.Insects); rownames(CALA.Insects)<-c("H", "C"); colnames(CALA.Insects)<-c("S","F")

CALA.Leporids<-rbind(CALA.H.Leporids,CALA.C.Leporids); rownames(CALA.Leporids)<-c("H", "C"); colnames(CALA.Leporids)<-c("S","F")

CALA.Rodents<-rbind(CALA.H.Rodents,CALA.C.Rodents); rownames(CALA.Rodents)<-c("H", "C"); colnames(CALA.Rodents)<-c("S","F")

CALA.Krat<-rbind(CALA.H.Krat,CALA.C.Krat); rownames(CALA.Krat)<-c("H", "C"); colnames(CALA.Krat)<-c("S","F")

prop.test(VUMA.Rodents)
prop.test(VUMA.Krat)
prop.test(VUMA.Insects)	
prop.test(VUMA.Leporids)

prop.test(CALA.Rodents)
prop.test(CALA.Krat)
prop.test(CALA.Insects)
prop.test(CALA.Leporids)