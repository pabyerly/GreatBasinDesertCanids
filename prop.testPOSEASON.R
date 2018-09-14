########################Compare change in proportions 
#HISTORIC VS CURRENT
VUMA.H.Krat.Winter<-c(109,37)
VUMA.C.Krat.Winter<-c(19,32)
VUMA.H.Krat.Summer<-c(116,32)
VUMA.C.Krat.Summer<-c(19,28)
VUMA.H.Rodents.Winter<-c(78,68)
VUMA.C.Rodents.Winter<-c(25,26)
VUMA.H.Rodents.Summer<-c(62,86)
VUMA.C.Rodents.Summer<-c(8,39)
VUMA.H.Leporids.Winter<-c(32,114)
VUMA.C.Leporids.Winter<-c(8,43)
VUMA.H.Leporids.Summer<-c(37,111)
VUMA.C.Leporids.Summer<-c(2,45)
VUMA.H.Insects.Winter<-c(29,117)
VUMA.C.Insects.Winter<-c(0,51)
VUMA.H.Insects.Summer<-c(89,59)
VUMA.C.Insects.Summer<-c(23,24)



CALA.H.Insects.Winter<-c(75,596)
CALA.C.Insects.Winter<-c(1,275)
CALA.H.Insects.Summer<-c(232,228)
CALA.C.Insects.Summer<-c(135,107)
CALA.H.Leporids.Winter<-c(463,208)
CALA.C.Leporids.Winter<-c(21,100)
CALA.H.Leporids.Summer<-c(313,147)
CALA.C.Leporids.Summer<-c(52,190)
CALA.H.Rodents.Winter<-c(254,417)
CALA.C.Rodents.Winter<-c(64,57)
CALA.H.Rodents.Summer<-c(139,321)
CALA.C.Rodents.Summer<-c(28,214)
CALA.H.Krat.Winter<-c(405,266)
CALA.C.Krat.Winter<-c(41,80)
CALA.H.Krat.Summer<-c(201,259)
CALA.C.Krat.Summer<-c(77,165)


VUMA.Krat.W<-rbind(VUMA.H.Krat.Winter,VUMA.C.Krat.Winter)
rownames(VUMA.Krat.W)<-c("H", "C"); colnames(VUMA.Krat.W)<-c("S","F")

VUMA.Rodents.W<-rbind(VUMA.H.Rodents.Winter,VUMA.C.Rodents.Winter)
rownames(VUMA.Rodents.W)<-c("H", "C"); colnames(VUMA.Rodents.W)<-c("S","F")

VUMA.Leporids.W<-rbind(VUMA.H.Leporids.Winter,VUMA.C.Leporids.Winter)
rownames(VUMA.Leporids.W)<-c("H", "C"); colnames(VUMA.Leporids.W)<-c("S","F")

VUMA.Insects.W<-rbind(VUMA.H.Insects.Winter,VUMA.C.Insects.Winter)
rownames(VUMA.Insects.W)<-c("H", "C"); colnames(VUMA.Insects.W)<-c("S","F")


VUMA.Krat.S<-rbind(VUMA.H.Krat.Summer,VUMA.C.Krat.Summer)
rownames(VUMA.Krat.S)<-c("H", "C"); colnames(VUMA.Krat.S)<-c("S","F")

VUMA.Rodents.S<-rbind(VUMA.H.Rodents.Summer,VUMA.C.Rodents.Summer)
rownames(VUMA.Rodents.S)<-c("H", "C"); colnames(VUMA.Rodents.S)<-c("S","F")

VUMA.Leporids.S<-rbind(VUMA.H.Leporids.Summer,VUMA.C.Leporids.Summer)
rownames(VUMA.Leporids.S)<-c("H", "C"); colnames(VUMA.Leporids.S)<-c("S","F")

VUMA.Insects.S<-rbind(VUMA.H.Insects.Summer,VUMA.C.Insects.Summer)
rownames(VUMA.Insects.S)<-c("H", "C"); colnames(VUMA.Insects.S)<-c("S","F")



CALA.Insects<-rbind(CALA.H.Insects.Winter,CALA.C.Insects.Winter); rownames(CALA.Insects)<-c("H", "C"); colnames(CALA.Insects)<-c("S","F")

CALA.Leporids<-rbind(CALA.H.Leporids.Winter,CALA.C.Leporids.Winter); rownames(CALA.Leporids)<-c("H", "C"); colnames(CALA.Leporids)<-c("S","F")

CALA.Rodents<-rbind(CALA.H.Rodents.Winter,CALA.C.Rodents.Winter); rownames(CALA.Rodents)<-c("H", "C"); colnames(CALA.Rodents)<-c("S","F")

CALA.Krat<-rbind(CALA.H.Krat.Winter,CALA.C.Krat.Winter); rownames(CALA.Krat)<-c("H", "C"); colnames(CALA.Krat)<-c("S","F")

CALA.Insects<-rbind(CALA.H.Insects.Winter,CALA.C.Insects.Winter); rownames(CALA.Insects)<-c("H", "C"); colnames(CALA.Insects)<-c("S","F")

CALA.Leporids<-rbind(CALA.H.Leporids.Winter,CALA.C.Leporids.Winter); rownames(CALA.Leporids)<-c("H", "C"); colnames(CALA.Leporids)<-c("S","F")

CALA.Rodents<-rbind(CALA.H.Rodents.Winter,CALA.C.Rodents.Winter); rownames(CALA.Rodents)<-c("H", "C"); colnames(CALA.Rodents)<-c("S","F")

CALA.Krat<-rbind(CALA.H.Krat.Winter,CALA.C.Krat.Winter); rownames(CALA.Krat)<-c("H", "C"); colnames(CALA.Krat)<-c("S","F")



CALA.Insects.S<-rbind(CALA.H.Insects.Summer,CALA.C.Insects.Summer); rownames(CALA.Insects.S)<-c("H", "C"); colnames(CALA.Insects.S)<-c("S","F")

CALA.Leporids.S<-rbind(CALA.H.Leporids.Summer,CALA.C.Leporids.Summer); rownames(CALA.Leporids.S)<-c("H", "C"); colnames(CALA.Leporids.S)<-c("S","F")

CALA.Rodents.S<-rbind(CALA.H.Rodents.Summer,CALA.C.Rodents.Summer); rownames(CALA.Rodents.S)<-c("H", "C"); colnames(CALA.Rodents.S)<-c("S","F")

CALA.Krat.S<-rbind(CALA.H.Krat.Summer,CALA.C.Krat.Summer); rownames(CALA.Krat.S)<-c("H", "C"); colnames(CALA.Krat.S)<-c("S","F")

CALA.Insects.S<-rbind(CALA.H.Insects.Summer,CALA.C.Insects.Summer); rownames(CALA.Insects.S)<-c("H", "C"); colnames(CALA.Insects.S)<-c("S","F")

CALA.Leporids.S<-rbind(CALA.H.Leporids.Summer,CALA.C.Leporids.Summer); rownames(CALA.Leporids.S)<-c("H", "C"); colnames(CALA.Leporids.S)<-c("S","F")

CALA.Rodents.S<-rbind(CALA.H.Rodents.Summer,CALA.C.Rodents.Summer); rownames(CALA.Rodents.S)<-c("H", "C"); colnames(CALA.Rodents.S)<-c("S","F")

CALA.Krat.S<-rbind(CALA.H.Krat.Summer,CALA.C.Krat.Summer); rownames(CALA.Krat.S)<-c("H", "C"); colnames(CALA.Krat.S)<-c("S","F")


prop.test(VUMA.Rodents.W)
prop.test(VUMA.Krat.W)
prop.test(VUMA.Insects.W)	
prop.test(VUMA.Leporids.W)
prop.test(VUMA.Rodents.S)
prop.test(VUMA.Krat.S)
prop.test(VUMA.Insects.S)	
prop.test(VUMA.Leporids.S)

prop.test(CALA.Rodents)
prop.test(CALA.Krat)
prop.test(CALA.Insects)
prop.test(CALA.Leporids)
prop.test(CALA.Rodents.S)
prop.test(CALA.Krat.S)
prop.test(CALA.Insects.S)
prop.test(CALA.Leporids.S)



