#' linker flags
#' Generate linker flags
#' This function prints the absolute path to the protobuf library file that is shipped with the package.
#' So that user package can use it in their Makevar file.
#' @examples 
#' LdFlags()
#' @export
#' @return nothing.
#' @param all flag to specify whether include GatingSet.pb.o file in the linker flag
LdFlags <- function(all = TRUE) {
  libs <-"libprotobuf.a"
  if(all)
    libs <- c("GatingSet.pb.o", libs)
  libpaths <- paste0("lib", Sys.getenv("R_ARCH"), "/", libs)
  
    
  cat(sapply(libpaths, function(libpath)tools::file_path_as_absolute(base::system.file(libpath, package = "RProtoBufLib"))))
}
