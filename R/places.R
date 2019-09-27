#' @title Places R6 class
#' @description The Places generator creates a new `Places`-object, which is the class containing
#' all the app logic. The class is based on the [R6][R6::R6Class] OO-system and
#' is thus reference-based with methods and data attached to each object, in
#' contrast to the more well known S3 and S4 systems.
#' @details If a _places.yml file exists in the root path. It will be read on initialization and
#' add working paths found in the file to the stored paths.
#' @format NULL
#' @usage NULL
#' @section Initialization:
#' A new 'Places'-object is [initialized][places::places-init] using the `new()` method on the generator:
#'
#' \tabular{l}{
#'  `paths <- places$new()`
#' }
#'
#'
#' @section Methods:
#'
#' \tabular{ll}{
#' [$add][places::places-add] \tab Add or Update paths to the object \cr
#' [$get][places::places-get] \tab Return stored paths by name \cr
#' [$names][places::places-names] \tab Return the names of the stored paths \cr
#' [$rm][places::places-rm] \tab Remove stored paths \cr
#' [$filepath][places::places-filepath] \tab Construct filepaths using stored paths as the root \cr
#' [$setwd][places::places-setwd] \tab set working directory with a stored path \cr
#' }
#'
#' @rdname places
#' @export
#' @importFrom R6 R6Class
#' @importFrom yaml read_yaml
places <- R6::R6Class(
  classname = "Places",
  public = list(
    initialize = function(root = here::here()) {
      .init(self,private,root=root)

      if(file.exists(file.path(self$root,'_places.yml'))){

        yml <- yaml::read_yaml(file.path(self$root,'_places.yml'))

        if(length(yml)){
          do.call(self$add,yml)
        }
      }
    },
    print = function(){
      .print(self,private)
    },
    root = NULL,
    tempdir = tempdir(),
    get = function(...){
      .get(self, private, ...)
    },
    names = function(){
      .names(self,private)
    },
    file.path = function(path,...,mustWork = TRUE){
      .filepath(self,private, path = path,...,mustWork = mustWork)
    },
    add = function(...){
      .add(self, private, ...)
    },
    rm = function(...){
      .rm(self,private,...)
    },
    setwd = function(place){
      .setwd(self,private,place)
    }
  ),
  private = list(
    paths = list()
  )
)
