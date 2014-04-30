## Please run unittest() to ensure that my code is correct


## Create a special "matrix" object that can cache its inverse.
## CacheMatrix is a list object with the following methods:
## get() - returns stored matrix
## set() - store different matrix, invalidate cache
## getsolve() - returns cached inverse value
## setsolve() - sets a new cached inverse value
makeCacheMatrix <- function(x = matrix()) {
    chachedSolve <- NULL
    set <- function(y) {
        x <<- y
        chachedSolve <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) chachedSolve <<- solve
    getsolve <- function() chachedSolve
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    chachedSolve <- x$getsolve()
    if(!is.null(chachedSolve)) {
        message("getting cached data")
        return(chachedSolve)
    }
    data <- x$get()
    solve <- solve(data, ...)
    x$setsolve(solve)
    solve
}


## This function is a simple unittest for makeCacheMatrix and cacheSolve

unittest <- function() {
    # prepare data
    matrix = matrix(runif(25), c(5, 5))
    correctSolution = solve(matrix)
    cacheMatrix = makeCacheMatrix(matrix)
    # cache should be empty
    stopifnot(is.null(cacheMatrix$getsolve()))
    # calculate solve
    solution <- cacheSolve(cacheMatrix)
    stopifnot(identical(solution, correctSolution))
    # cache should be filled
    stopifnot(identical(cacheMatrix$getsolve(), correctSolution))
    # set different matrix
    cacheMatrix$set(matrix(0))
    # cache should be empty again
    stopifnot(is.null(cacheMatrix$getsolve()))
}