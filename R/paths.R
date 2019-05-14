#' @title Add/Update stored path
#' @description Add or Update a stored path in the places object
#' @param self places self object
#' @param private places private object
#' @param \dots named elements to store
#' @examples
#'  dir <- places$new()
#'  dir
#'  dir$add(back = '..',this='.')
#'  dir
#'  dir$names()
#' @rdname places_add
#' @aliases places-add
#' @seealso
#'  [places][places::places]
.add <- function(self,private,...){

  new_paths <- list(...)

  new_paths <- setNames(lapply(file.path(self$root,new_paths),normalizePath,mustWork = TRUE),names(new_paths))

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
#' @param \dots named elements to remove from storage
#' @examples
#'  dir <- places$new()
#'  dir
#'  dir$add(back = '..',this='.')
#'  dir
#'  dir$names()
#'  dir$rm('back')
#'  dir$names()
#' @rdname places_rm
#' @aliases places-rm
#' @seealso
#'  [places][places::places]
.rm <- function(self,private,obj){
  for(i in seq_along(obj)){
    private$paths[[obj[[i]]]] <- NULL
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
#'  dir <- places$new()
#'  root <- basename(dir$root)
#'  dir$add(back = '..',this='.')
#'  dir$filepath('back',root)
#'
#'  #set mustWork to FALSE to create new directories or files
#'  dir$filepath('back','somefile.R',mustWork = FALSE)
#' @rdname places_filepath
#' @aliases places-filepath
#' @seealso
#'  [places][places::places]
.filepath <- function(self,private,path,...,mustWork = TRUE){
  normalizePath(file.path(self$get(path),...),mustWork = mustWork)
}
