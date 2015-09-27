## Put comments here that give an overall description of what your
## functions do

# Purpose: This is the second programming assignment at Johns Hopkins Coursera: R Programming (Dr. Roger Peng).  
# Short Desription: A pair of functions to obtain an inverse matrix: use solve() function for uncached matrix, and get from the cached one if already calculated
# Student: Hajime Uchiyama
# Created on: 9/27/2015
# Submitted on: 9/27/2015

## Write a short comment describing this function
# Creates a vector containing four functions: 
# - setmatrix: set the value of the matrix
# - getmatrix: get the value of the matrix
# - setinverse: set the inverse of the matrix
# - getinverse: get the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        setmatrix <- function(y) {
                x <<- y
                m <<- NULL
        }
        getmatrix <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(setmatrix = setmatrix, getmatrix = getmatrix,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
# Calculates the inverse of the matrix created with the above function. However, it first checks to see if the inverse matrix has already been calculated. If so, it gets the inverse matrix from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inverse matrix in the cache via the setinverse function.
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$getmatrix()
        m <- solve(matrix, ...)
        x$setinverse(m)
        m
}

