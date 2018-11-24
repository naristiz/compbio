# Basic properties of atomic vectors in R
# 13 September, 2018
# Natalia Aristizabal

# use assignment operator
x <- 5 # preferred than =
print(x) # get used to using "print" instead of just calling the object
typeof(x) # function to know what type of object
str(x) # also tells you what structure or type of object, used for more complex objects
is.numeric(x) # logic function to know 
is.character(x)

# building one dimenstional vectors
# the combine function
z <- c(3.2,5,5,6)
str(z)

# c command always "flattens"

z <- c(c(3,4),c(5,6))
print(z)

# vectors of character strings (vectors don't have to be numbers)
z <- c("perch", "bass", "red snapper", 'trout') # either " or ' can be used
print(z)

# use single or double with embedded quotes
z <- c("this is 'one' strong", 'and another')
print(z) # prints two elements

# we can build logical variables (TRUE/FALSE)
z <- c(TRUE, TRUE, FALSE) # better to spell out TRUE/FALSE instead of using T/F
print(z)

# variable names
z <- 3 # short, but not informative. Requires careful thought in naming objects

plant_height <- 3 # too long and uses dash you try:
plant.height <- 3 # period uses in another ways. Rather not use. 
plantHeight  <- 3 # Gotelli's recommended way of naming. called camelCase naming.Figure your own style, but be consistent. It's super important for programs to behave well. 

# properties of vectors
# 1) type

z <- c(1.1, 2, 3, 4)
typeof(z)              # we always want to know the type of variable. First step.
is.character(z)
is.numeric(z)
is.integer(z)

# 2) length of an atomic vector
length(z)

# 3) names 
z <- runif(5)
# names not initially assigned
names(z)
names(z) <- c("chow","pug","beagle","greyhound","akita")
print(z)              

# another way to do this. add names when variable is created
z2 <- c(gold=3.3, silver=10, lead=2)  # using the actual = sign 
print(z2)  # recognized as strings
names(z2) <- NULL
print(z2)
names(z2) <- c("red","green")
print(z2)

# names do not have to be distinct
names(z2) <- c("red","red")
print(z2)      

# special data types or data elements
# NA values for missing data. Get in the habit to use it to distinguish from TRUE zeros.
z <- c(3.2,3.2,NA)
typeof(z) # NA doesnt change its atomic value.
typeof(z[3]) # [ ] refers to the particular slot inside an element
z1 <- NA
typeof(z1)

# NA values carry through for the entire vector
is.na(z1)
! # in a bunch of langauges means the opposite or negation 
!is.na(z)
mean(z) # cannot make calculation
mean(!is.na(z))

# NaN - Inf and Inf from numeric division
z <- 0/0
typeof(z)
print(z)
z <- 1/0
print(z)
z <- -1/0
print(z)  # not much to do with infinite numbers in R. But good to know how to recognize them in R. 

# three features of atomic variables

# 1) coercion 

a <- c(2,2.0)
typeof(a)   # double (in other words as a real number)

b <- c("purple","green")
typeof(b)   # character 

d <- c(a,b)
typeof(d)   # in many languages this would give you an error, but R will not complain, it will assign the numeric values as character strings. R coerced these to a certain type.

# coercion order:
# logical -> integers -> doubles -> character
# with comman "is" or "as" we can convert 

# Conversions very useful in combination with logical variables
a <- runif(10)
print(a)
a > 0.5
aboolean <- a > 0.5 # vector of logicals. (Nick Gotelli calls "objects" as "variables")
sum(a)
sum(aboolean)  # as we saw above, logical gets converted into integers. So TRUEs become 1 and FALSE 0s
sum(a > 0.5) # adding and coercing a logical
mean(a > 0.5) # an elegant way that gives proportion of TRUES

# tail values for a normal distribution
mean(rnorm(1000)>2)  # gives me the proportion of values that are greater than 2
mean(rnorm(1000)==2) # == is a comparison
mean(rnorm(1000)!=2) # short code lines by taking advantage of the coercion properties of R

# Vectorization 
z <- c(10,20,30)
z + 1
y <- c(1,2,3)
z + y
z^2
myResult <- z^2  # normally we will not put numbers in our code. Only for debugging. Usually we assign a variable.

# Recycling
z <- c(10,20,30)
y <- c(1,2)
z + y            # starts recycling the shorter element to the longer element as needed.

# one of the best features of working in R are these propoerties of coercing, vectorization and recycling because we can avoid loops and more complicated code. 

# II. Creating vectors
# creating an empty vector and expanding it (DON"T DO THIS!). It will make it super slow. There are other languages that do require to expand this way, but not R. So don't do this. 

z <- vector(mode="numeric",length=0)
print(z)
z <- c(z,5)
print(z)

# better way is to pre-allocate vector space
z <- rep(0,100)
str(z)
head(z)
tail(z)

# start with NAs (because after all we don't have any data yet)
z <- rep(NA,100)
str(z)
head(z)
tail(z)
typeof(z)

z[2] <- "Adams"
head(z)
typeof(z)

# efficiently add names to an atomic vector (labeling row values)
myVector <- runif(100)
myNames <- paste("Species",seq(1:length(myVector)),sep="") # used the built in functions instead of hardwiring numbers in
names(myVector)  # nothing in there because we havend added it. See next line:
names(myVector) <- myNames
head(myVector)

# use rep() function to repeat elements and vectors

rep(0.5,6)
rep(x=0.5,times=6)        # better coding habit to do it this way instead
myVec <- c(2,4,1)
rep(x=myVec,times=2)
rep(x=myVec,each=2)
rep(x=myVec,times=myVec)  # fancy
rep(x=myVec,each=myVec)   # Since myVec is a vector, it tool the command of the first value "2". probably not what we want to do, but good to know. 

# use seq() to create regular sequences
seq(from=2,to=4)
2:4
seq(from=2,to=4,by=0.5)
seq(from=2,to=4,length=7)
1:length(myVec)
seq_along(myVec) # same command but faster than above. calculate the number of vectors.
seq_len(5)       # calculate the number of values (not vectors)

# quickly creating random numbers 
runif(5) # 5 [0,1] uniform
runif(n=3,min=100,max=110)

rnorm(6) # normal distribution with mean = 0 and standard deviation of 1
rnorm(n=3,mean=100,sd=10)  # your own normal distribution

# sample function gives us very powerful ways to sample fron an atomic vector

longVec <- LETTERS[1:10]  # because we called the function in capitals, it will give me capital letters. Same function with minusculas.
print(longVec)
sample(longVec)           # reordering. fast way to randomize lists like this. 
vecTreat <- c(rep("Control",5),rep("Treatment",5))
sample(vecTreat)          # a good way to check if a data set is random or not. If random, shuffled version should look same !!! incomplete! ask Gotelli
sample(x=longVec,size=3)
sample(x=longVec,size=16) # sample can't resample, so it would have to be clarified. like line below:
sample(x=longVec,size=16,replace=TRUE)
myWeights <- c(rep(20,5),rep(100,5))
myWeights
sample(x=longVec,replace=TRUE,prob=myWeights)
sample(x=longVec,replace=FALSE,prob=myWeights)   # used a lot in simulations when you want to manipulate probabilities of an outcome
