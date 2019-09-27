Tests and Coverage
================
23 July, 2019 06:29:28

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                      | Coverage (%) |
| :-------------------------- | :----------: |
| places                      |     100      |
| [R/paths.R](../R/paths.R)   |     100      |
| [R/places.R](../R/places.R) |     100      |
| [R/utils.R](../R/utils.R)   |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                  |  n |  time | error | failed | skipped | warning |
| :------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-init.R](testthat/test-init.R)   |  3 | 0.002 |     0 |      0 |       0 |       0 |
| [test-utils.R](testthat/test-utils.R) | 12 | 0.011 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                          | context | test                                | status | n |  time |
| :-------------------------------------------- | :------ | :---------------------------------- | :----- | -: | ----: |
| [test-init.R](testthat/test-init.R#L10)       | init    | initialize: default                 | PASS   | 1 | 0.002 |
| [test-init.R](testthat/test-init.R#L25)       | init    | initialize: other root              | PASS   | 1 | 0.000 |
| [test-init.R](testthat/test-init.R#L29)       | init    | initialize: yaml paths              | PASS   | 1 | 0.000 |
| [test-utils.R](testthat/test-utils.R#L24)     | utils   | utilities and methods: get all      | PASS   | 1 | 0.000 |
| [test-utils.R](testthat/test-utils.R#L28)     | utils   | utilities and methods: get single   | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L32)     | utils   | utilities and methods: get multiple | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L36)     | utils   | utilities and methods: names        | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L41)     | utils   | utilities and methods: rm           | PASS   | 1 | 0.004 |
| [test-utils.R](testthat/test-utils.R#L46)     | utils   | utilities and methods: add          | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L51)     | utils   | utilities and methods: add old      | PASS   | 1 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L55)     | utils   | utilities and methods: file.path    | PASS   | 1 | 0.000 |
| [test-utils.R](testthat/test-utils.R#L62_L65) | utils   | utilities and methods: print        | PASS   | 2 | 0.001 |
| [test-utils.R](testthat/test-utils.R#L76)     | utils   | utilities and methods: setwd        | PASS   | 2 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version    |
| :------- | :--------- |
| testthat | 2.1.1      |
| covr     | 3.2.0.9000 |
| covrpage | 0.0.70     |

</details>

<!--- Final Status : pass --->
