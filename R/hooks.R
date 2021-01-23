
dllInfo <- NULL

.onLoad <- function(libname, pkgname) {
   
   # load pb and pbmalloc on supported platforms   
   pb <- pbLibPath()
   if (!is.null(pb)&&Sys.info()['sysname']!="Windows") {
      if (!file.exists(pb)) {
         warning(paste("libprotobuf library", pb, "not found."))
      } else {
         dllInfo <<- dyn.load(pb, local = FALSE, now = TRUE)
      }
   }
   
     gs <- gsLibPath()
   if (!is.null(gs)&&Sys.info()['sysname']!="Windows") {
     if (!file.exists(gs)) {
       warning(paste("libGatingSet.pb library", gs, "not found."))
     } else {
       dllInfo <<- c(dllInfo, dyn.load(gs, local = FALSE, now = TRUE))
     }
   }
      
}

.onUnload <- function(libpath) {
   
   # unload the package library
   # library.dynam.unload("RProtoBufLib", libpath)
   
   # unload dll if we loaded it
   for(dll in dllInfo)
   if (!is.null(dll))
      dyn.unload(dll[["path"]])
   
}
