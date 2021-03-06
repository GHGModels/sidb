
#This script reads all yaml entries in the database, asigns them a name (their own folder name), and puts the output in the global environment

library(yaml)
entryNames=list.dirs("~/sidb/data/", full.names=FALSE, recursive=FALSE)
  
for(i in 1:length(entryNames)){
    assign(entryNames[i], yaml.load_file(input=paste("~/sidb/data/",entryNames[i],"/metadata.yaml",sep="")))
  }

citationKey=NULL
for(i in 1:length(entryNames)){
  citationKey[i]=get(entryNames[i])$citationKey
}

doi=NULL
for(i in 1:length(entryNames)){
  doi[i]=get(entryNames[i])$doi
}

entryAuthor=NULL
for(i in 1:length(entryNames)){
  entryAuthor[i]=get(entryNames[i])$entryAuthor
}

entryCreationDate=NULL
for(i in 1:length(entryNames)){
  entryCreationDate[i]=get(entryNames[i])$entryCreationDate
}

latitude=NULL
for(i in 1:length(entryNames)){
  latitude=c(latitude,get(entryNames[i])$siteInfo$coordinates$latitude)
}

longitude=NULL
for(i in 1:length(entryNames)){
  longitude=c(longitude,get(entryNames[i])$siteInfo$coordinates$longitude)
}

incubationTime=NULL
for(i in 1:length(entryNames)){
  if(get(entryNames[i])$incubationInfo$incubationTime$units=="days"){
  incubationTime[i]=get(entryNames[i])$incubationInfo$incubationTime$time
  }
  if(get(entryNames[i])$incubationInfo$incubationTime$units=="hours"){
    incubationTime[i]=(get(entryNames[i])$incubationInfo$incubationTime$time)/24 #transforms units to days
  }
}

climate=NULL
for(i in 1:length(entryNames)){
  climate=c(climate,get(entryNames[i])$siteInfo$climate)
}

ecosystemType=NULL
for(i in 1:length(entryNames)){
  ecosystemType=c(ecosystemType,get(entryNames[i])$siteInfo$ecosystemType)
}

studySite=NULL
for(i in 1:length(entryNames)){
  studySite=c(studySite,get(entryNames[i])$siteInfo$studySite)
}

treatments=NULL
for(i in 1:length(entryNames)){
  treatments=c(treatments,get(entryNames[i])$incubationInfo$treatments)
}

soilType=NULL
for(i in 1:length(entryNames)){
  soilType=c(soilType,get(entryNames[i])$siteInfo$soilType)
}
