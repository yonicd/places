
<!-- README.md is generated from README.Rmd. Please edit that file -->

# places

<!-- badges: start -->

<!-- badges: end -->

The goal of places is to leverage [here](https://github.com/r-lib/here)
to create named locations for project work.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("yonicd/places")
```

## Example

``` r
library(places)
```

``` r
fs::dir_tree(path = '.',recurse = TRUE)
#> .
#> ├── DESCRIPTION
#> ├── LICENSE
#> ├── LICENSE.md
#> ├── NAMESPACE
#> ├── R
#> │   ├── paths.R
#> │   ├── places.R
#> │   └── utils.R
#> ├── README.Rmd
#> ├── README.md
#> ├── _pkgdown.yml
#> ├── _places.yml
#> ├── docs
#> │   ├── LICENSE-text.html
#> │   ├── LICENSE.html
#> │   ├── articles
#> │   │   ├── Usage.html
#> │   │   └── index.html
#> │   ├── authors.html
#> │   ├── docsearch.css
#> │   ├── docsearch.js
#> │   ├── favicon.ico
#> │   ├── index.html
#> │   ├── link.svg
#> │   ├── pkgdown.css
#> │   ├── pkgdown.js
#> │   ├── pkgdown.yml
#> │   └── reference
#> │       ├── index.html
#> │       ├── places.html
#> │       ├── places_add.html
#> │       ├── places_filepath.html
#> │       ├── places_get.html
#> │       ├── places_init.html
#> │       ├── places_names.html
#> │       ├── places_rm.html
#> │       └── places_setwd.html
#> ├── man
#> │   ├── places.Rd
#> │   ├── places_add.Rd
#> │   ├── places_filepath.Rd
#> │   ├── places_get.Rd
#> │   ├── places_init.Rd
#> │   ├── places_names.Rd
#> │   ├── places_rm.Rd
#> │   └── places_setwd.Rd
#> ├── tests
#> │   ├── README.md
#> │   ├── testthat
#> │   │   ├── test-init.R
#> │   │   └── test-utils.R
#> │   └── testthat.R
#> └── vignettes
#>     ├── Usage.R
#>     ├── Usage.Rmd
#>     └── Usage.html
```

``` r
paths <- places$new(root='.')
```

``` r
paths$add(
  R = 'R',
  Vignettes ='vignettes',
  tests='tests'
)
```

``` r
paths
#> $root
#> [1] "/Users/yonis/projects/places"
#> 
#> $tempdir
#> [1] "/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T//RtmpyFhAkf"
#> 
#> $paths
#> $paths$R
#> [1] "/Users/yonis/projects/places/R"
#> 
#> $paths$Vignettes
#> [1] "/Users/yonis/projects/places/vignettes"
#> 
#> $paths$tests
#> [1] "/Users/yonis/projects/places/tests"
```

``` r
paths$root
#> [1] "/Users/yonis/projects/places"
```

``` r
paths$get('R')
#> [1] "/Users/yonis/projects/places/R"
```

``` r
list.files(paths$file.path('tests','testthat'))
#> [1] "test-init.R"  "test-utils.R"
```

``` r
paths$rm('R')
```

``` r
paths$get()
#> $Vignettes
#> [1] "/Users/yonis/projects/places/vignettes"
#> 
#> $tests
#> [1] "/Users/yonis/projects/places/tests"
```
