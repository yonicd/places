#' @title Initialize places object
#' @description Initialize new places object with root, Default: here::here()
#' @param self places self object
#' @param private places private object
#' @param root root path of the object, Default: here::here()
#' @return print method for the places object
#' @details root path is tested via [normalizePath][base::normalizePath] that it exists.
#' @examples
#'  places$new()
#'  places$new(here::here('..'))
#' @importFrom here here
#' @rdname places_init
#' @aliases places-init
#' @seealso
#'  [places][places::places], [here][here::here]
.init <- function(self,private,root = here::here()){
  self$root    <- normalizePath(root,mustWork = TRUE)
}

# @title print method of places object
# @description print method of places object returns the root and stored paths
# @param self places self object
# @param private places private object
# @return print method for the places object
.print <- function(self,private){
  print(list(root = self$root,tempdir = self$tempdir, paths = self$get()))
}

#' @title Get stored paths
#' @description Get a path or a list of paths stored in places object
#' @param self places self object
#' @param private places private object
#' @param \dots names of stored paths
#' @return single name returns a character, multiple names or empty returns a list
#' @examples
#'  paths <- places$new()
#'  paths
#'  paths$add(back = '..',this='.')
#'  paths$get()
#'  paths$get('back')
#'  paths$get(c('back','this'))
#' @rdname places_get
#' @aliases places-get
#' @seealso
#'  [places][places::places]
.get <- function(self,private,...){

  obj <- unlist(list(...))

  if(length(obj)==0)
    return(private$paths)

  if(length(obj)==1)
    return(private$paths[[obj]])

  if(length(obj)>1)
    return(private$paths[obj])

}

#' @title Get names of stored paths
#' @param self places self object
#' @param private places private object
#' @description Get names of the stored paths in the places object
#' @examples
#'  paths <- places$new()
#'  paths
#'  paths$add(back = '..',this='.')
#'  paths$names()
#' @rdname places_names
#' @aliases places-names
#' @seealso
#'  [places][places::places]
.names <- function(self,private){
  names(private$paths)
}

#' @title Set working directory using a stored path
#' @param self places self object
#' @param private places private object
#' @param place name of stored path
#' @description Set working directory using a stored path
#' @examples
#'  paths <- places$new()
#'  paths
#'  paths$add(back = '..',this='.')
#'  paths$setwd('back')
#'  paths$setwd('this')
#' @rdname places_setwd
#' @aliases places-setwd
#' @seealso
#'  [places][places::places]
.setwd <- function(self,private,place){
  setwd(self$get(place))
}

