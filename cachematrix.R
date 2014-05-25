# Example usage:
# > myMatrix <- matrix(rnorm(4), nrow = 2)                // Create a matrix x
# > myInverseMatrix <- makeCacheMatrix(x)                  // Create Cached Inverse matrix
# > myInverseMatrix$get()                                  // Get the  matrix
# > cacheSolve(myInverseMatrix)                            // Return the inverse
# > cacheSolve(myInverseMatrix)                            // Call the 2nd time, so return
#                                                        // the cached inverse


# makeCacheMatrix: return a list of functions to:
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  #invMatrix will store the cached version of matrxi inverse
  myInvMatrix <- NULL
  #setter for  matrix
  set <- function(pInputMatrx) {
    x <<- pInvMatrix
    myInvMatrix <<- NULL
  }
  #getter for the  matrix
  get<-function() x
  # Setter for the inverse
  setinvMatrix <- function(pInverse) myInvMatrix <<- pInverse
  # Getter for the inverse
  getinvMatrix <- function() myInvMatrix
  
  
  list(set = set, get = get, setinvMatrix = setinvMatrix, getinvMatrix = getinvMatrix)
  
}


# cacheSolve: Compute matrix inverse. If the inverse is already
# computed, the matrix will bre retrieved from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  myInvMatrix <- x$getinvMatrix()
  
  # If the inverse is already computed, return it
  if (!is.null(myInvMatrix)) {
    message("getting cached data")
    return(myInvMatrix)
  }
  
  # The inverse is not yet computed, compute now
  myMatrixdata <- x$get()
  myInvMatrix <- solve(myMatrixdata, ...)
  
  # Cache the inverse
  x$setinvMatrix(myInvMatrix)
  
  # Return it
  myInvMatrix
}
