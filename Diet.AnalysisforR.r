#Required packages: stringr
#Required packages: plyr
library(stringr)
library(plyr)

#Set output location
output.data.path<-"~/RDatasets/Diet/"  #Identify location to store output files
data.path <-"~/RDatasets/Diet/"       #Identify path to data file
data.file <-"diet.data"               #Identify name of data file
diet.data <- read.table(file=paste(data.path, data.file, ".txt", sep=""), header=TRUE, sep="\t") #Import data file
#Accepts file name with spaces if in ""  and replaces empty columns/cells with NA
#Combines spaces (column headers/cells) w/ "."

#Select only the columns necessary for the analyses
diet.data<-subset(diet.data, select=c(Sample.ID, Extent, Elevation.Class, Season, Species.FID, Species.MID, Krat, Rabbit, Rodent, Insect, Scorpion, Plant, Bird, Reptile, Anthro, Ungulate, Misc, Unknown))
sum(is.na(diet.data[,1:6])) # check to make sure there is no missing data in the first 6 columns independent variables
diet.data[is.na(diet.data)]<-0 #Set all NAs (all are in the data) to 0

#####################################Calculate Stats for each combination analyzed by Kozlowski - Create diet.summary data file
t<-1  #Initialize t at 1
for(i in 1:length(levels(diet.data$Species.MID))){ #Begin within Species Loop
  temp.diet1<-subset(diet.data, diet.data$Species.MID==levels(diet.data$Species.MID)[i]) #Select only samples for species i
  for(k in 1:length(levels(temp.diet1$Elevation.Class))){ #Begin within Elevation Loop
    temp.diet2<-subset(temp.diet1, temp.diet1$Elevation.Class==levels(temp.diet1$Elevation.Class)[k]) #Select only Elevation class k within species i
    for(m in 1:length(levels(temp.diet2$Season))){  #Begin within Season Loop
      temp.diet3<-subset(temp.diet2, temp.diet2$Season==levels(temp.diet2$Season)[m]) #Select only season m within elevation k and species i
      temp.total.count<-sum(temp.diet3[,7:18])  #Count all occurrences within the subsetted data
        Count<-NULL                             #Initialize vectors for Count, Occurrence, and frequency
        Occur<-NULL
        Freq<-NULL
        for(j in 7:length(temp.diet3[0,])){     #Loop over each of the food/diet categories
          Count<-append(Count,sum(temp.diet3[,j]))                        #Create a vector with each count
          Occur<-append(Occur, sum(temp.diet3[,j])/temp.total.count)      #Create a vector with each %Occurrence
          Freq<-append(Freq, sum(temp.diet3[,j]/length(temp.diet3[,l])))  #Create a vector with each %Frequency
          }
        temp<-as.data.frame(rbind(Count, Occur, Freq))                    #Combine into a single dataframe by row
        names(temp)<-names(temp.diet3[7:18])                              #Change the column names to match data
        Season<-levels(temp.diet3$Season)[m]; temp<-cbind(Season,temp)    #Attach the season data in a column
        Elevation<-levels(temp.diet3$Elevation.Class)[k]; temp<-cbind(Elevation,temp) #Attach the elevation data in a column
        Extent<-"Both"; temp<-cbind(Extent,temp)                          #Attach the extent data in a column
        Species<-levels(temp.diet3$Species.MID)[i]; temp<-cbind(Species,temp) #Attach the species data in a column
        Stat<-row.names(temp); temp<-cbind(Stat,temp)
        row.names(temp)<-c(1:length(row.names(temp)))                     #Assign rows sequential number names
        assign(paste("temp",t, sep="."),temp); t<-t+1                     #Store as a temporary data frame #t, increase t incrementally
      } #End within Season Loop
    temp.total.count<-sum(temp.diet2[,7:18]) #Counts for elevation loop across all seasons
      Count<-NULL
      Occur<-NULL
      Freq<-NULL
      for(j in 7:length(temp.diet2[0,])){
        Count<-append(Count,sum(temp.diet2[,j]))
        Occur<-append(Occur, sum(temp.diet2[,j])/temp.total.count)
        Freq<-append(Freq, sum(temp.diet2[,j]/length(temp.diet2[,l])))
        }
      temp<-as.data.frame(rbind(Count, Occur, Freq))
      names(temp)<-names(temp.diet2[7:18])
      Season<-"Both"; temp<-cbind(Season,temp)
      Elevation<-levels(temp.diet2$Elevation.Class)[k]; temp<-cbind(Elevation,temp)
      Extent<-"Both"; temp<-cbind(Extent,temp)
      Species<-levels(temp.diet2$Species.MID)[i]; temp<-cbind(Species,temp)
      Stat<-row.names(temp); temp<-cbind(Stat,temp)
      row.names(temp)<-c(1:length(row.names(temp)))
      assign(paste("temp",t, sep="."),temp); t<-t+1
    } #End within Elevation Loop
  temp.total.count<-sum(temp.diet1[,7:18])
    Count<-NULL
    Occur<-NULL
    Freq<-NULL
    for(j in 7:length(temp.diet1[0,])){
      Count<-append(Count,sum(temp.diet1[,j]))
      Occur<-append(Occur, sum(temp.diet1[,j])/temp.total.count)
      Freq<-append(Freq, sum(temp.diet1[,j]/length(temp.diet1[,l])))
      }
    temp<-as.data.frame(rbind(Count, Occur, Freq))
    names(temp)<-names(temp.diet1[7:18])
    Season<-"Both"; temp<-cbind(Season,temp)
    Elevation<-"Both"; temp<-cbind(Elevation,temp)
    Extent<-"Both"; temp<-cbind(Extent,temp)
    Species<-levels(temp.diet1$Species.MID)[i]; temp<-cbind(Species,temp)
    Stat<-row.names(temp); temp<-cbind(Stat,temp)
    row.names(temp)<-c(1:length(row.names(temp)))
    assign(paste("temp",t, sep="."),temp); t<-t+1
  } #End within Species Loop

#Combine all of the temp data frames into a single data frame
diet.summary<-rbind(temp.1, temp.2);
diet.summary<-rbind(diet.summary, temp.3);
diet.summary<-rbind(diet.summary, temp.4);
diet.summary<-rbind(diet.summary, temp.5);
diet.summary<-rbind(diet.summary, temp.6);
diet.summary<-rbind(diet.summary, temp.7);
diet.summary<-rbind(diet.summary, temp.8);
diet.summary<-rbind(diet.summary, temp.9);
diet.summary<-rbind(diet.summary, temp.10);
diet.summary<-rbind(diet.summary, temp.11);
diet.summary<-rbind(diet.summary, temp.12);
diet.summary<-rbind(diet.summary, temp.13);
diet.summary<-rbind(diet.summary, temp.14);

#Remove unneccessary values
rm(Count); rm(Occur); rm(Freq)
rm(list=ls(pattern="^temp"))

#######################Calculate summary data by extent (done on an annual basis) and attach to summary data 
for(i in 1:length(levels(diet.data$Species.MID))){ #Begin within Species Loop
  temp.diet1<-subset(diet.data, diet.data$Species.MID==levels(diet.data$Species.MID)[i])
  for(k in 1:length(levels(temp.diet1$Extent))){ #Begin within Extent Loop
    temp.diet2<-subset(temp.diet1, temp.diet1$Extent==levels(temp.diet1$Extent)[k])
    temp.total.count<-sum(temp.diet2[,7:18]) #Counts for elevation loop across all seasons
      Count<-NULL
      Occur<-NULL
      Freq<-NULL
      for(j in 7:length(temp.diet2[0,])){
        Count<-append(Count,sum(temp.diet2[,j]))
        Occur<-append(Occur, sum(temp.diet2[,j])/temp.total.count)
        Freq<-append(Freq, sum(temp.diet2[,j]/length(temp.diet2[,l])))
        }
      temp<-as.data.frame(rbind(Count, Occur, Freq))
      names(temp)<-names(temp.diet2[7:18])
      Season<-"Both"; temp<-cbind(Season,temp)
      Elevation<-"Both"; temp<-cbind(Elevation,temp)
      Extent<-levels(temp.diet2$Extent)[k]; temp<-cbind(Extent,temp)
      Species<-levels(temp.diet2$Species.MID)[i]; temp<-cbind(Species,temp)
      Stat<-row.names(temp); temp<-cbind(Stat,temp)
      row.names(temp)<-c(1:length(row.names(temp)))
      assign(paste("temp",t, sep="."),temp); t<-t+1
    } #End within Elevation Loop
  } #End within Species Loop
  
#Combine to the single data frame
diet.summary<-rbind(diet.summary, temp.15);
diet.summary<-rbind(diet.summary, temp.16);
diet.summary<-rbind(diet.summary, temp.17);
diet.summary<-rbind(diet.summary, temp.18);
#Remove unneccessary values
rm(Count); rm(Occur); rm(Freq)
rm(list=ls(pattern="^temp"))
#############################################################################END CREATION OF DIET SUMMARY DATA
##############################################################################################################

##########################################################Create Function to calculate diet analyses
#Takes and Input dataframe with 2 rows - the two rows that you want to comparison
#NOTE: FUNCTION MUST BE SAVED LOCALLY BEFORE IT CAN BE CALLED BY diet.analysis(DATAFRAME)
diet.analysis<-function(z){
  x<-as.numeric(z[1,6:17])   #Identify group X data
  y<-as.numeric(z[2,6:17])   #Identify group Y data

  lambda.x<-sum(x*(x-1))/(sum(x)*(sum(x)-1))
  lambda.y<-sum(y*(y-1))/(sum(y)*(sum(y)-1))
  Morisita.Index<-(2*sum(x*y))/((lambda.x+lambda.y)*(sum(x)*sum(y)))
  est.lambda.x<-sum(x^2)/(sum(x))^2
  est.lambda.y<-sum(y^2)/(sum(y))^2

  est.Morisita.Index<-(2*sum(x*y))/((est.lambda.x+est.lambda.y)*(sum(x)*sum(y)))

  H.x<-sum((log10(sum(x)/x))*(x/sum(x)),na.rm=T)     #Shannon-Weiner Diversity index for x
  H.y<-sum((log10(sum(y)/y))*(y/sum(y)),na.rm=T) #Shannon-Weiner Diversity index for y
  H.max<-sum(((x/(sum(sum(x,na.rm=T),sum(y,na.rm=T),na.rm=T)))*(log10((sum(sum(x,na.rm=T),sum(y,na.rm=T)))/x))),
             ((y/(sum(sum(x,na.rm=T),sum(y,na.rm=T),na.rm=T)))*(log10((sum(sum(x,na.rm=T),sum(y,na.rm=T)))/y))),na.rm=T)
  H.xy<-sum(((x+y)/(sum(sum(x),sum(y),na.rm=T)))*(log10((sum(sum(x),sum(y),na.rm=T))/(x+y))),na.rm=T)
  H.min<-sum(((sum(x)/sum(x,y))*H.x),((sum(y)/sum(x,y))*H.y))
  Horn.Index<-(H.max-H.xy)/(H.max-H.min) #Ro
  Heterogeneity.Index<-1-Horn.Index #Rh
  
  temp.S2.Hx<-((sum(x[x!=0]*(log10(x[x!=0])^2)))-((sum(x[x!=0]*log10(x[x!=0])))^2/sum(x[x!=0])))/(sum(x[x!=0]))^2
  temp.S2.Hy<-((sum(y[y!=0]*(log10(y[y!=0])^2)))-((sum(y[y!=0]*log10(y[y!=0])))^2/sum(y[y!=0])))/(sum(y[y!=0]))^2
  Hutcheson.t<-(H.x-H.y)/sqrt(temp.S2.Hx+temp.S2.Hy)
  Hutcheson.df<-((temp.S2.Hx+temp.S2.Hy)^2)/(temp.S2.Hx^2/sum(x[x!=0])+temp.S2.Hy^2/sum(y[y!=0]))
  Hutcheson.pvalue<-2*pt(Hutcheson.t,Hutcheson.df, lower=F)
  if(Hutcheson.pvalue<0.05){Hutcheson.result<-"Reject Ho: Difference in diet diversity"}else Hutcheson.result<-"Accept Ho: No difference in diet diversity"

  #Calculate X2 as done by Kozlowski et al. 2008 - Incorrect due to sample sizes being small - and also increased values to 1
  #To remove, Comment out the following 3 lintes and line from data frame construction
  #temp.x<-x; temp.x[temp.x==0]<-1; temp.x<-temp.x[-12]
  #temp.y<-y; temp.y[temp.y==0]<-1; temp.y<-temp.y[-12]
  #X2.test<-chisq.test(temp.x, p=temp.y/sum(temp.y)); X2<-as.numeric(X2.test[1]); X2.df<-as.numeric(X2.test[2]); X2.pv<-as.numeric(X2.test[3])                                                                                                                                             
  #X2.test<-chisq.test(temp.x, p=temp.y/sum(temp.y), simulate.p.value = T, B=500); X2<-as.numeric(X2.test[1]); X2.df<-length(temp.x)-1; X2.pv<-as.numeric(X2.test[3])

  #Calculate X2 by removing those food categories that represent less than 5% of the total combined diet
  idx<-NULL
  for(i in 1:length(x)){
    if((x[i]+y[i])/sum(x+y)<0.045)idx<-append(idx,i)
    }
   X2.test<-chisq.test(as.data.frame(rbind(x[-idx],y[-idx])),correct=T) #Remove the categories contributing less than 5% of the diet, correct.T applies Yates correction
   X2<-as.numeric(X2.test[1]); X2.df<-as.numeric(X2.test[2]); X2.pv<-as.numeric(X2.test[3])

  ##Combine calculated statistics into a single dataframe
  temp2<-as.data.frame(cbind(lambda.x,lambda.y)); temp2<-cbind(temp2,est.Morisita.Index)
  temp2<-cbind(temp2,H.x); temp2<-cbind(temp2,H.y); temp2<-cbind(temp2,H.min); temp2<-cbind(temp2,H.max)
  temp2<-cbind(temp2,Horn.Index); temp2<-cbind(temp2,Heterogeneity.Index)
  temp2<-cbind(temp2,Hutcheson.t); temp2<-cbind(temp2,Hutcheson.df)
  temp2<-cbind(temp2,Hutcheson.pvalue); temp2<-cbind(temp2,Hutcheson.result)
  temp2<-cbind(temp2,X2); temp2<-cbind(temp2,X2.df); temp2<-cbind(temp2,X2.pv) 

  ##Add the information on the data to the dataframe
  Season<-paste(as.character(z$Season[1]),as.character(z$Season[2]),sep=".")
  temp2<-cbind(Season,temp2)
  Elevation<-paste(as.character(z$Elevation[1]),as.character(z$Elevation[2]),sep=".")
  temp2<-cbind(Elevation,temp2)
  Extent<-paste(as.character(z$Extent[1]),as.character(z$Extent[2]),sep=".")
  temp2<-cbind(Extent,temp2)
  SpeciesX.Y<-paste(as.character(z$Species[1]),as.character(z$Species[2]),sep=".")
  temp2<-cbind(SpeciesX.Y,temp2)
  row.names(temp2)<-c(1:length(row.names(temp2)))
  return(temp2)
  }

####NOTE: INCLUDES CALCULATION OF SIMPSONS DIVERSITY (LAMBDAs), MORISITA'S INDEX OF OVERLAP (TRUE AND ESTIMATED*),
#### SHANNON-WEINER DIVERSITY INDEX, HORN'S SIMILARITY INDEX, HETEROGENEITY INDEX, AND CHI-SQUARE TESTS
####################################################################END Function to calculate diet analyses

##################################BEGIN DIET ANALYSIS BETWEEN COMBINATINS OF DATA SETS - SIMILAR TO THOSE COMPARED BY KOZLOWSKI ET AL. 2008
temp<-subset(diet.summary, diet.summary$Stat=="Count") #Only need count data for diversity statistics

z<-subset(temp, temp$Elevation=="Both" & temp$Extent=="Both" & temp$Season=="Both") #Comparing VUMA/CALA across both seasons and full extent
diet.stats<-diet.analysis(z) #Comparing Annual CALA vs Annual VUMA
z<-subset(temp, temp$Species=="VUMA" & (temp$Elevation=="Highland" | temp$Elevation=="Lowland") & temp$Extent=="Both" & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Annual VUMA: Highland vs Lowlands
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Highland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland VUMA: Summer vs Winter
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Lowland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland VUMA: Summer vs Winter
z<-subset(temp, temp$Species=="CALA" & (temp$Elevation=="Highland" | temp$Elevation=="Lowland") & temp$Extent=="Both" & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Annual CALA: Highland vs Lowlands
z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Highland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland CALA: Summer vs Winter
z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Lowland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland CALA: Summer vs Winter
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Highland" & temp$Extent=="Both" & temp$Season=="Winter")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland Winter: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Highland" & temp$Extent=="Both" & temp$Season=="Summer")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland Summer: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Lowland" & temp$Extent=="Both" & temp$Season=="Winter")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland Winter: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Lowland" & temp$Extent=="Both" & temp$Season=="Summer")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland Summer: CALA vs VUMA

z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Both" & (temp$Extent=="C" | temp$Extent=="H") & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing CALA: Current Extent vs. Historic 
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Both" & (temp$Extent=="C" | temp$Extent=="H") & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing VUMA: Current Extent vs. Historic

diet.stats.min<-diet.stats[c(1:4,7:9,12,14:20),]


#diet.stats.MID<-diet.stats
#diet.summary.MID<-diet.summary


###################################################
###################################################
###################################################
###################################################
###############################################################################Calculating based on Field ID
idx<-grep("VUVU",diet.data$Species.FID)
diet.data<-diet.data[-idx,]
diet.data$Species.FID<-factor(diet.data$Species.FID)

t<-1

for(i in 1:length(levels(diet.data$Species.FID))){ #Begin within Species Loop
  temp.diet1<-subset(diet.data, diet.data$Species.FID==levels(diet.data$Species.FID)[i])
  for(k in 1:length(levels(temp.diet1$Elevation.Class))){ #Begin within Elevation Loop
    temp.diet2<-subset(temp.diet1, temp.diet1$Elevation.Class==levels(temp.diet1$Elevation.Class)[k])
    for(m in 1:length(levels(temp.diet2$Season))){  #Begin within Season Loop
      temp.diet3<-subset(temp.diet2, temp.diet2$Season==levels(temp.diet2$Season)[m])
      temp.total.count<-sum(temp.diet3[,7:18])
        Count<-NULL
        Occur<-NULL
        Freq<-NULL
        for(j in 7:length(temp.diet3[0,])){
          Count<-append(Count,sum(temp.diet3[,j]))
          Occur<-append(Occur, sum(temp.diet3[,j])/temp.total.count)
          Freq<-append(Freq, sum(temp.diet3[,j]/length(temp.diet3[,l])))
          }
        temp<-as.data.frame(rbind(Count, Occur, Freq))
        names(temp)<-names(temp.diet3[7:18])
        Season<-levels(temp.diet3$Season)[m]; temp<-cbind(Season,temp)
        Elevation<-levels(temp.diet3$Elevation.Class)[k]; temp<-cbind(Elevation,temp)
        Extent<-"Both"; temp<-cbind(Extent,temp)
        Species<-levels(temp.diet3$Species.FID)[i]; temp<-cbind(Species,temp)
        Stat<-row.names(temp); temp<-cbind(Stat,temp)
        row.names(temp)<-c(1:length(row.names(temp)))
        assign(paste("temp",t, sep="."),temp); t<-t+1
      } #End within Season Loop
    temp.total.count<-sum(temp.diet2[,7:18]) #Counts for elevation loop across all seasons
      Count<-NULL
      Occur<-NULL
      Freq<-NULL
      for(j in 7:length(temp.diet2[0,])){
        Count<-append(Count,sum(temp.diet2[,j]))
        Occur<-append(Occur, sum(temp.diet2[,j])/temp.total.count)
        Freq<-append(Freq, sum(temp.diet2[,j]/length(temp.diet2[,l])))
        }
      temp<-as.data.frame(rbind(Count, Occur, Freq))
      names(temp)<-names(temp.diet2[7:18])
      Season<-"Both"; temp<-cbind(Season,temp)
      Elevation<-levels(temp.diet2$Elevation.Class)[k]; temp<-cbind(Elevation,temp)
      Extent<-"Both"; temp<-cbind(Extent,temp)
      Species<-levels(temp.diet2$Species.FID)[i]; temp<-cbind(Species,temp)
      Stat<-row.names(temp); temp<-cbind(Stat,temp)
      row.names(temp)<-c(1:length(row.names(temp)))
      assign(paste("temp",t, sep="."),temp); t<-t+1
    } #End within Elevation Loop
  temp.total.count<-sum(temp.diet1[,7:18])
    Count<-NULL
    Occur<-NULL
    Freq<-NULL
    for(j in 7:length(temp.diet1[0,])){
      Count<-append(Count,sum(temp.diet1[,j]))
      Occur<-append(Occur, sum(temp.diet1[,j])/temp.total.count)
      Freq<-append(Freq, sum(temp.diet1[,j]/length(temp.diet1[,l])))
      }
    temp<-as.data.frame(rbind(Count, Occur, Freq))
    names(temp)<-names(temp.diet1[7:18])
    Season<-"Both"; temp<-cbind(Season,temp)
    Elevation<-"Both"; temp<-cbind(Elevation,temp)
    Extent<-"Both"; temp<-cbind(Extent,temp)
    Species<-levels(temp.diet1$Species.FID)[i]; temp<-cbind(Species,temp)
    Stat<-row.names(temp); temp<-cbind(Stat,temp)
    row.names(temp)<-c(1:length(row.names(temp)))
    assign(paste("temp",t, sep="."),temp); t<-t+1
  } #End within Species Loop

#Combine all of the temp data frames into a single data frame
diet.summary<-rbind(temp.1, temp.2);
diet.summary<-rbind(diet.summary, temp.3);
diet.summary<-rbind(diet.summary, temp.4);
diet.summary<-rbind(diet.summary, temp.5);
diet.summary<-rbind(diet.summary, temp.6);
diet.summary<-rbind(diet.summary, temp.7);
diet.summary<-rbind(diet.summary, temp.8);
diet.summary<-rbind(diet.summary, temp.9);
diet.summary<-rbind(diet.summary, temp.10);
diet.summary<-rbind(diet.summary, temp.11);
diet.summary<-rbind(diet.summary, temp.12);
diet.summary<-rbind(diet.summary, temp.13);
diet.summary<-rbind(diet.summary, temp.14);

#Remove unneccessary values
rm(Count); rm(Occur); rm(Freq)
rm(list=ls(pattern="^temp"))

#######################Calculate differences by extent, done on an annual basis since sample size for historic extent is so small
for(i in 1:length(levels(diet.data$Species.FID))){ #Begin within Species Loop
  temp.diet1<-subset(diet.data, diet.data$Species.FID==levels(diet.data$Species.FID)[i])
  for(k in 1:length(levels(temp.diet1$Extent))){ #Begin within Extent Loop
    temp.diet2<-subset(temp.diet1, temp.diet1$Extent==levels(temp.diet1$Extent)[k])
    temp.total.count<-sum(temp.diet2[,7:18]) #Counts for elevation loop across all seasons
      Count<-NULL
      Occur<-NULL
      Freq<-NULL
      for(j in 7:length(temp.diet2[0,])){
        Count<-append(Count,sum(temp.diet2[,j]))
        Occur<-append(Occur, sum(temp.diet2[,j])/temp.total.count)
        Freq<-append(Freq, sum(temp.diet2[,j]/length(temp.diet2[,l])))
        }
      temp<-as.data.frame(rbind(Count, Occur, Freq))
      names(temp)<-names(temp.diet2[7:18])
      Season<-"Both"; temp<-cbind(Season,temp)
      Elevation<-"Both"; temp<-cbind(Elevation,temp)
      Extent<-levels(temp.diet2$Extent)[k]; temp<-cbind(Extent,temp)
      Species<-levels(temp.diet2$Species.FID)[i]; temp<-cbind(Species,temp)
      Stat<-row.names(temp); temp<-cbind(Stat,temp)
      row.names(temp)<-c(1:length(row.names(temp)))
      assign(paste("temp",t, sep="."),temp); t<-t+1
    } #End within Elevation Loop
  } #End within Species Loop

#Combine to the single data frame
diet.summary<-rbind(diet.summary, temp.15);
diet.summary<-rbind(diet.summary, temp.16);
diet.summary<-rbind(diet.summary, temp.17);
diet.summary<-rbind(diet.summary, temp.18);
#Remove unneccessary values
rm(Count); rm(Occur); rm(Freq)
rm(list=ls(pattern="^temp"))

#Combinations
temp<-subset(diet.summary, diet.summary$Stat=="Count") #Only need count data for diversity statistics

z<-subset(temp, temp$Elevation=="Both" & temp$Extent=="Both" & temp$Season=="Both") #Comparing VUMA/CALA across both seasons and full extent
diet.stats<-diet.analysis(z) #Comparing Annual CALA vs Annual VUMA
z<-subset(temp, temp$Species=="VUMA" & (temp$Elevation=="Highland" | temp$Elevation=="Lowland") & temp$Extent=="Both" & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Annual VUMA: Highland vs Lowlands
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Highland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland VUMA: Summer vs Winter
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Lowland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland VUMA: Summer vs Winter
z<-subset(temp, temp$Species=="CALA" & (temp$Elevation=="Highland" | temp$Elevation=="Lowland") & temp$Extent=="Both" & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Annual CALA: Highland vs Lowlands
z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Highland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland CALA: Summer vs Winter
z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Lowland" & temp$Extent=="Both" & (temp$Season=="Summer" | temp$Season=="Winter"))
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland CALA: Summer vs Winter
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Highland" & temp$Extent=="Both" & temp$Season=="Winter")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland Winter: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Highland" & temp$Extent=="Both" & temp$Season=="Summer")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Highland Summer: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Lowland" & temp$Extent=="Both" & temp$Season=="Winter")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland Winter: CALA vs VUMA
z<-subset(temp, (temp$Species=="CALA" | temp$Species=="VUMA") & temp$Elevation=="Lowland" & temp$Extent=="Both" & temp$Season=="Summer")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing Lowland Summer: CALA vs VUMA

z<-subset(temp, temp$Species=="CALA" & temp$Elevation=="Both" & (temp$Extent=="C" | temp$Extent=="H") & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing CALA: Current Extent vs. Historic 
z<-subset(temp, temp$Species=="VUMA" & temp$Elevation=="Both" & (temp$Extent=="C" | temp$Extent=="H") & temp$Season=="Both")
diet.stats<-rbind(diet.stats,diet.analysis(z)) #Comparing VUMA: Current Extent vs. Historic


diet.stats.FID<-diet.stats
diet.summary.FID<-diet.summary

range(abs(diet.stats.MID$Horn.Index-diet.stats.FID$Horn.Index))
range(abs(diet.stats.MID$est.Morisita.Index-diet.stats.FID$est.Morisita.Index))
range(abs(diet.stats.MID$H.x-diet.stats.FID$H.x))
range(abs(diet.stats.MID$H.y-diet.stats.FID$H.y))

differences<-sum(abs(as.numeric(diet.stats.FID$Hutcheson.pvalue<0.05)-as.numeric(diet.stats.MID$Hutcheson.pvalue<0.05)))
differences2<-sum(abs(as.numeric(diet.stats.FID$X2.pv<0.05)-as.numeric(diet.stats.MID$X2.pv<0.05)))