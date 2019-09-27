testthat::context('utils')

here::set_here()

testthat::describe('utilities and methods',{

  td <- file.path(normalizePath(tempdir()),'places')

  dir.create(td,recursive = TRUE,showWarnings = FALSE)
  dir.create(file.path(td,'up'),recursive = TRUE,showWarnings = FALSE)

  test_paths <- list(here='.',back='..',up='up')

  yaml::write_yaml(test_paths,
                   file = file.path(td,'_places.yml'))

  paths <- places::places$new(root = td)

  get_paths <- lapply(test_paths,FUN=function(x,td){
    normalizePath(file.path(td,x))
  },td=td)

  it('get all',{
    expect_equal(paths$get(),get_paths)
  })

  it('get single',{
    expect_equal(paths$get('here'),get_paths[[1]])
  })

  it('get multiple',{
    expect_equal(paths$get('here','up'),get_paths[c(1,3)])
  })

  it('names',{
    expect_equal(paths$names(),names(get_paths))
  })

  it('rm',{
    paths$rm('back')
    expect_equal(paths$names(),names(get_paths)[c(1,3)])
  })

  it('add',{
    paths$add(back='..')
    expect_equal(paths$names(),names(get_paths)[c(1,3,2)])
  })

  it('add old',{
    paths$add(back='..')
    expect_equal(paths$names(),names(get_paths)[c(1,3,2)])
  })

  it('file.path',{
    expect_equal(paths$file.path('here','up'),get_paths[[3]])
  })

  it('print',{

    pp <- capture.output(print(paths))

    testthat::expect_equal(
      grep('^[$]',pp,value = TRUE),
      c("$root", "$paths", "$paths$here", "$paths$up", "$paths$back")
      )

    pp_c <- unlist(get_paths,use.names = FALSE)[c(1,3,2)]

    testthat::expect_equal(
      gsub('^(.*?)\\s|\\"','',pp[!grepl('^[$]',pp)&nzchar(pp)]),
      c(pp_c[1],pp_c)
    )
  })

  it('setwd',{
    testthat::expect_equal(getwd(),paths$setwd('up'))
    testthat::expect_equal(getwd(),paths$setwd('here'))
  })

  unlink(td,recursive = TRUE,force = TRUE)

})

unlink('.here')
