---
title: 'Week 4 Homework: Vectors in R and Regular Expressions'
author: "Natalia Aristizabal"
date: "9/19/2018"
output: 
  html_document: 
    highlight: tango
    keep_md: yes
    theme: cerulean
---



Exercise 1: "Suppose x = 1.1, a = 2.2, and b = 3.3. Assign each expression to the value of the variable z and print the value stored in z".

```r
# Values given
x = 1.1
a = 2.2
b = 3.3

# solve for the following equations

# a
z <- x^(a^b)
print(z)
```

```
## [1] 3.61714
```

```r
# b 
z <- (x^a)^b
print(z)
```

```
## [1] 1.997611
```

```r
# c
z <- 3*{x^3}+2*{x^2}+1
print(z)
```

```
## [1] 7.413
```

Exercise 2: "Using the rep and seq functions, create the following vectors"

```r
# a
z <- c(seq(1:8),seq(from=7,to=1))
print(z)
```

```
##  [1] 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1
```

```r
# b
myVec <- c(seq(1,5))  # same as 1:5
z <- rep(x=myVec,times=myVec)
print(z)
```

```
##  [1] 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
```

```r
# c
myVec <- 5:1
z <- rep(x=myVec,times=1:5)
print(z)
```

```
##  [1] 5 4 4 3 3 3 2 2 2 2 1 1 1 1 1
```

Exercise 3: "Create a vector of two random uniform numbers. In a spatial map, these can be interpreted as x and y coordinates that give the location of an individual (such as a marked forest tree in a plot that has been mapped). Using one of R’s inverse trigonometry functions (asin(), acos(), or atan()), convert these numbers into polar coordinates."


```r
x <- runif(n=1,min=0,max=100)
y <- runif(n=1,min=0,max=100)

r <- sqrt(x^2+y^2)^(1/2)
theta <- atan(y/x)
print(c(r,theta))
```

```
## [1] 7.9874970 0.9800269
```

Exercise 4: "Suppose that queue <- c("sheep", "fox", "owl", "ant") and that queue represents the animals that are lined up to enter Noah’s Ark, with the sheep at the front of the line. Using R expressions, update the queue successively as:"


```r
queue <- c("sheep", "fox", "owl", "ant")
print(queue)
```

```
## [1] "sheep" "fox"   "owl"   "ant"
```

```r
# a. the serpent arrives
queue <- c(queue,"serpent")
print(queue)
```

```
## [1] "sheep"   "fox"     "owl"     "ant"     "serpent"
```

```r
# b. the sheep enters the ark;
queue <- queue[-1]
print(queue)
```

```
## [1] "fox"     "owl"     "ant"     "serpent"
```

```r
# c. the donkey arrives and talks his way to the front of the line;
queue <- c("donkey",queue)
print(queue)
```

```
## [1] "donkey"  "fox"     "owl"     "ant"     "serpent"
```

```r
# d. the serpent gets impatient and leaves```
queue <- queue[-5]
print(queue)
```

```
## [1] "donkey" "fox"    "owl"    "ant"
```

```r
# e. the owl gets bored and leaves.
queue <- queue[-3]
print(queue)
```

```
## [1] "donkey" "fox"    "ant"
```

```r
# f. the aphid arrives and the ant invites him to cut in line.
queue <- c(queue[1:2],"aphid",queue[3])
print(queue)
```

```
## [1] "donkey" "fox"    "aphid"  "ant"
```

```r
# g. Finally, determine the position of the aphid in the line.
aphid <- which(queue=="aphid")
print(aphid)
```

```
## [1] 3
```

Exercise 5: "Use R to create a vector of all of the integers from 1 to 100 that are not divisible by 2, 3, or 7."

```r
vector <- 1:100
vector <- vector[!(!vector%%2) + (!vector%%3) + (!vector%%7)]
print(vector)
```

```
##  [1]  1  5 11 13 17 19 23 25 29 31 37 41 43 47 53 55 59 61 65 67 71 73 79
## [24] 83 85 89 95 97
```


#### Regular Expression Puzzles in BBEdit

Exercise 6. using a single regular expression, transform these lines into what we need for a .csv file: To get rid off 2 or more spaces: 

```r
# Find: \s{2,} 
# Replace: ,
```



Exercise 7. Organize into first and last name of the collaborator and their institution. Identified first set of elements with (w+), a space followed by a set of elements \s(w+), and space followed by the entire rest of the line, \s(.*). Then just placed the previously identified elements in order wanted: second, first and (third). 

```r
# Find: (\w+),\s(\w+),\s(.*) 
# Replace: \2 \1 (\3)
```


Exercise 8. To separate each file first I identified the first spaced followed by four numbers to replace it with a single line break after the first element. Then grabbing the whole number and placing after the second element followed by an underscore and the first and third elements.

```r
# Find: \s(\d{4})
# Replace: \n\1

# Find: (\d+) (.+)(.mp3) 
# Replace: \2_\1\3
```

Exercise 9. Write a single regular expression to rearrange the data set by First letter_species, last number:

Identify the first element (\w) or first letter. Then the rest of the word, second word (\w+), next number (.+), final number (.+). To replace I will choose from the identified elements: the first, third, and fourth. 

```r
# Find: (\w)(\w+),(\w+),.+,(.+)
# Replace: \1_\3,\4
```



Beginning with the original data set for exercise 9, rearrange it to abbreviate the species name like this (First letter_first four letters of species, last number):

Identify the parts I will want to replace First letter (\w). Then the rest of the word,next four elements or letters of the genus (/w{4}) and then the rest of the second word (\w+), next character or in this case number (.+), final number (.+). To replace I will choose from the identified elements: the first, third, and sixth. 

```r
# Find: (\w)(\w+),(\w{4})(\w+),(.+),(.+) 
# Replace: \1_\3,\6
```


 