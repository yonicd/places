#' @title Places R6 class
#' @description The Places generator creates a new `Places`-object, which is the class containing
#' all the app logic. The class is based on the [R6][R6::R6Class] OO-system and
#' is thus reference-based with methods and data attached to each object, in
#' contrast to the more well known S3 and S4 systems.
#' @format NULL
#' @usage NULL
#' @section Initialization:
#' A new 'Places'-object is [initialized][places::places-init] using the `new()` method on the generator:
#'
#' \tabular{l}{
#'  `dirs <- places$new()`
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
#' }
#'
#' @rdname places
#' @export
#' @importFrom R6 R6Class
places <- R6::R6Class(
  classname = "Places",
  public = list(
    initialize = function(root = here::here()) {
      .init(self,private,root=root)
    },
    print = function(){
      .print(self,private)
    },
    root = NULL,
    get = function(...){
      .get(self, private, ...)
    },
    names = function(){
      .names(self,private)
    },
    filepath = function(path,...,mustWork = TRUE){
      .filepath(self,private, path = path,...,mustWork = mustWork)
    },
    add = function(...){
      .add(self, private, ...)
    },
    rm = function(obj){
      .rm(self,private,obj)
    }
  ),
  private = list(
    paths = list()
  )
)
