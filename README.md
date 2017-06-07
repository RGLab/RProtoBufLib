# Protocol buffers library as an R package

This package provides the C++ headers and static library of Protocol buffers 2.6.0 for other R packages to compile and link against. Here is the instructions of using it:

### Install the package
```r
devtools::install_github("RGLab/RProtoBufLib")
```
### Modified **DESCRIPTION** file
- add `RProtoBufLib` to `LinkingTo` field so that the user package knows where to find the headers
```
LinkingTo: Rcpp, RProtoBufLib
```

### Modified **src/Makevars** file

- point the linker to the `libprotobuf.a` file so that the user package will statically linked to it.

```bash
PKG_LIBS =`${R_HOME}/bin/Rscript -e "RProtoBufLib::LdFlags()"`
```
