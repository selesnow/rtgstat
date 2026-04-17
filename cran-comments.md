## Resubmission
This is a resubmission to address the NOTE received from the CRAN auto-check service on the previous submission (0.3.5).

In this version I have:
* Fixed the NOTE regarding the missing dependency on R >= 4.1.0 by replacing the `\(...)` function shorthand syntax with the classic `function(...)` syntax in `R/tg_api_usage.R`. The package no longer requires R 4.1.0 features.
* Addressed the previous Nu HTML checker warning regarding the language specification by setting `Language: en-US` in the DESCRIPTION file.

## Test environments
* local Windows 10 install, R 4.4.x
* ubuntu 22.04 (on GitHub Actions), R-release, R-devel
* win-builder (devel and release)

## R CMD check results
0 errors | 0 warnings | 0 notes
