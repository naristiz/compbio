# basic operations on matrices and lists
# 19 September 2018
# NJG Computational biology
# Natalia Aristizabal's notebook

m <- matrix(data=1:12,
            nrow=4,
            ncol=3)  # default is to fill the column first
print(m)
dim(m)  # returns the number of rows and columns in a matrix
m <- matrix(data=1:12,
            nrow=4,
            byrow=TRUE)  # specifies that the rows are filled first

# change dimensions
dim(m) <- c(6,2)
print(m)
dim(m) <- c(4,3)
print(m)
length(m)   # simply returns the number of elements.

# add row and column names
rownames(m)
rownames(m) <- c("a","b","c","d")
print(m)
colnames(m) <- LETTERS[1:ncol(m)]
print(m)
print(m[2,3])      # [row,column]
print(m[1:2,2:3])  # allows me to pull out and change values inside matrices. ( ) are applied to functions. [ ] operations inside functions.
print(m[,2:3])     # not specifying a row or a column will give ALL of the elements. 
print(m[1:2,])
print(m[,])        # all rows and all columns. 
print(m[,,])       # for 3D dimensional arrays. matrices are 2D. 
rownames(m) <- paste("Species",LETTERS[1:nrow(m)],sep="")  # if I have more than 26 rows in this matrix, then it will start repeating letters.
colnames(m) <- paste("Site",1:ncol(m),sep="")
print(m)
m["SpeciesD","Site2"]  # will return the element on tha position. Or elements if there are two SpeciesD and Site2 labels.

dimnames(m) <- list(paste("Site",1:nrow(m),sep=""),
                     paste("Species",letters[1:ncol(m)],sep=""))
print(m)

# useful function = t for transpose
print(t(m))

# adding rows or columns to matrix
m2 <- t(m)
m2 <- rbind(m2,c(20,20,30,40))  # slow to increase the size of a matrix this way. But for small operations its ok.
print(m2)  # we don't have a name for that last row. So:
rownames(m2)
rownames(m2)[4] <- "myFix"
m2["myFix","Site1"]   # to get an exact value for example
m2[c("myFix","Speciesa"),c("Site1","Site4")]
