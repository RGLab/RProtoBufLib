#' linker flags
#' Generate linker flags
#' This function prints the absolute path to the protobuf library file that is shipped with the package.
#' So that user package can use it in their Makevar file.
#' @examples 
#' LdFlags()
#' @export
LdFlags <- function() {
  libpath <- paste0("lib", Sys.getenv("R_ARCH"), "/libprotobuf.a")
  cat(tools::file_path_as_absolute(base::system.file(libpath, package = "RProtoBufLib")))
}
