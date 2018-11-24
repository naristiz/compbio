# Script for batch processing of multiple files
# November 1, 2018
# Class by NJG and notes by NAU

#################################################
# function: FileBuilder
# creates a set of random files for regression
# input: 
# fileN = number of files to create
# fileFolder = name of folder to hold files
# file size = c(min,max) number of rows
# fileNA - average number of NA values per column
# output: set of random files 
# ------------------------------------------------
# seq_len = 1:fileLength, here seq_along not useful because we only have one number, not a vector

fileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles/",
                        fileSize=c(15,100),
                        fileNA=3){
  for(i in seq_len(fileN)){
    fileLength <- sample(fileSize[1]:fileSize[2],size=1)
    varX <- runif(fileLength)
    varY <- runif(fileLength)
    dF <- data.frame(varX,varY)
    barVals <- rpois(n=1,lambda=fileNA)  # lambda specifies file NA
    dF[sample(nrow(dF),size=badVals),1] <- NA   # these steps are to throw dirt into the fake data, to make it more like real data with NA
    dF[sample(nrow(dF),size=badVals),2] <- NA
    
    # create label for file name with padded zeroes
    fileLabel <- paste(fileFolder,
                       "ranFile",
                       formatC(i,
                               width=3,
                               format="d",
                               flag="0"),   
                              ".csv",sep="")   # complicated but just basically pasting strings and numbers together
    
    # set up data file and incorporate time stamp and minimal meta data
    # will create a csv file for us
    # will graph date and time form computer to put on output file
    write.table(cat("# Simulated random data file for batch processing","\n", 
                "timeStamp: ",as.character(Sys.time()),"\n",
                file=fileLabel, 
                row.names="",
                col.names="",
                sep="")) # we don't want yet anything on these
    
    # finally, add the data frame
    write.table(x=dF,
                file=fileLabel,
                sep=",",
                row.names = FALSE,
                append=TRUE)
  }
} # gonna add new material into same file name, but below! Not going to write over it.

### didn't work... get notes from someone else


##########################################
# function: regStats
# fits linear model extract statistics
# input: 2-column data frame (x and y)
# output: slope, p-value, and r2
########################################

regStats <- function(d=NULL) {
  if(is.null(d)) {
    xVar <- runif(10)
    yVar <- runif(10)
    d <- data.frame(xVar,yVar)
  }    # end of fake data in case its null
  . <- lm(data=d,d[,2]~d[,1])
  . <- summary(.)
  statsList <- list(Slope=.$coefficients[2,1],
                    pVal=.$coefficients[2,4],
                    r2=.$r.squared)   # specific names from summary table, would prob need to be adapted to other column names
  return(statsList)
}


##################################################################################
# set.seed(100)

#----------------------------------------------------------------
# Global variables
fileFolder <- "RandomFiles/"
nFiles <- 100
fileOut <- "StatsSummary.csv"
#---------------------------------------------------------------

# create 100 random data sets
fileBuilder(fileN=nFiles)
fileNames <- list.files(path=fileFolder) # grabs all files inside specific folder and runs them as strings

# create data frame to hold summary statistics
ID <- seq_along(fileNames)   # creates a sequence from 1-100 bc the folder has 100 elements in it
slope <- rep(NA,nFiles)
pVal <- rep(NA,nFiles)
r2 <- rep(NA,nFiles)
statsOut <- data.frame(ID,fileNames,slope,pVal,r2)

# batch process through each file with a loop
for(i in seq_along(fileNames)) {
  data <- read.table(file=paste(fileFolder,fileNames[i], sep=""),
                     sep=",",
                     header=TRUE)
  dClean <- data[complete.cases(data),]
  . <- regStats(dClean)
  statsOut[i,3:5] <- unlist(.)
}

# set up output file and incorporate time stamp
# and minimal metadata

write.table(cat("# Summary stats for ",
                "# batch processing of regression models","\n",
                "# timestamp: ", as.character(Sys.time()),
                "# NJG","\n",
                "#---------------------------","\n",
                "\n",
file=fileOut,
row.names="",
col.names="",
sep=""))

# now add the data frame
write.table(x=statsOut,
file=fileOut,
row.names=
  col.names=
  sep=
                     
                    