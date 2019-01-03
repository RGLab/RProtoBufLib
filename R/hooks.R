
dllInfo <- NULL

.onLoad <- function(libname, pkgname) {
   
   # load pb and pbmalloc on supported platforms   
   pb <- pbLibPath()
   if (!is.null(pb)) {
      if (!file.exists(pb)) {
         warning(paste("pb library", pb, "not found."))
      } else {
         dllInfo <<- dyn.load(pb, local = FALSE, now = TRUE)
      }
   }
    
   # load the package library
   # library.dynam("RProtoBufLib", pkgname, libname)
   
}

.onUnload <- function(libpath) {
   
   # unload the package library
   # library.dynam.unload("RProtoBufLib", libpath)
   
   # unload pb if we loaded it
   if (!is.null(dllInfo))
      dyn.unload(dllInfo[["path"]])
}
