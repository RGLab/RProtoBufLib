
dllInfo <- NULL

.onLoad <- function(libname, pkgname) {
   
   # load pb and pbmalloc on supported platforms   
   pb <- pbLibPath("-lite")
   if (!is.null(pb)) {
      if (!file.exists(pb)) {
         warning(paste("libprotobuf library", pb, "not found."))
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
   
   # unload dll if we loaded it
  for(dll in dllInfo)
   if (!is.null(dll))
      dyn.unload(dll[["path"]])
}
