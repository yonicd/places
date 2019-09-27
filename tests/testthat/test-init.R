testthat::context('init')

here::set_here()

testthat::describe('initialize',{

  paths <- places::places$new(root = getwd())

  it('default',{
    testthat::expect_equal(paths$root,getwd())
  })

  td <- file.path(normalizePath(tempdir()),'places')

  dir.create(td,recursive = TRUE,showWarnings = FALSE)
  dir.create(file.path(td,'up'),recursive = TRUE,showWarnings = FALSE)

  yaml::write_yaml(list(here='.',back='..',up='up'),
                   file = file.path(td,'_places.yml'))

  paths_td <- places::places$new(root = td)


  it('other root',{
    testthat::expect_equal(paths_td$root,td)
  })

  it('yaml paths',{
    testthat::expect_equal(paths_td$root,paths_td$get('here'))
  })

  unlink(td,recursive = TRUE,force = TRUE)

})

unlink('.here')
