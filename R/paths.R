#' @title Add/Update stored path
#' @description Add or Update a stored path in the places object
#' @param self places self object
#' @param private places private object
#' @param \dots named elements to store
#' @examples
#'  paths <- places$new()
#'  paths
#'  paths$add(back = '..',this='.')
#'  paths
#'  paths$names()
#' @rdname places_add
#' @aliases places-add
#' @seealso
#'  [places][places::places]
#'  @importFrom stats setNames
.add <- function(self,private,...){

  new_paths <- list(...)

  new_paths <- stats::setNames(lapply(file.path(self$root,new_paths),normalizePath,mustWork = TRUE),names(new_paths))

  old_elems <- intersect(names(new_paths),names(private$paths))
  new_elems <- setdiff(names(new_paths),names(private$paths))

  if(is.null(names(private$paths))){
    private$paths <- append(private$paths,new_paths)
  }else{

    if(length(new_elems)>0){
      for(i in seq_along(new_elems))
        private$paths[[new_elems[i]]] <- new_paths[[new_elems[i]]]
    }

    if(length(old_elems)>0){
      for(i in seq_along(old_elems))
        private$paths[[old_elems[i]]] <- new_paths[[old_elems[i]]]
    }
  }

}

#' @title Remove a stored path
#' @description Remove a stored path in the places object
#' @param self places self object
#' @param private places private object
#' @param \dots name(s) of stored path(s)
#' @examples
#'  paths <- places$new()
#'  paths
#'  paths$add(back = '..',this='.')
#'  paths
#'  paths$names()
#'  paths$rm('back')
#'  paths$names()
#' @rdname places_rm
#' @aliases places-rm
#' @seealso
#'  [places][places::places]
.rm <- function(self,private,...){

  place <- list(...)

  for(i in seq_along(place)){
    private$paths[[place[[i]]]] <- NULL
  }

}

#' @title Create file.paths
#' @description Use stored paths as the root of a file.path call
#' @param self places self object
#' @param private places private object
#' @param path name of stored path
#' @param \dots additional character vectors
#' @param mustWork logical that is passed to [normalizePath][base::normalizePath], Default: TRUE
#' @examples
#'  paths <- places$new()
#'  root <- basename(paths$root)
#'  paths$add(back = '..',this='.')
#'  paths$file.path('back',root)
#'
#'  #set mustWork to FALSE to create new directories or files
#'  paths$file.path('back','somefile.R',mustWork = FALSE)
#' @rdname places_filepath
#' @aliases places-filepath
#' @seealso
#'  [places][places::places]
.filepath <- function(self,private,path,...,mustWork = TRUE){
  normalizePath(file.path(self$get(path),...),mustWork = mustWork)
}
