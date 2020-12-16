# Build against static libraries from rwinlib
VERSION <- commandArgs(TRUE)
if(!file.exists(sprintf("../windows/protobuf-%s/include/google/protobuf/message.h", VERSION))){
	if(getRversion() < "3.3.0") setInternet2()
	download.file(sprintf("http://rglab.github.io/binaries/lib/protobuf-%s.zip", VERSION), "lib.zip", quiet = TRUE)
	dir.create("../windows", showWarnings = FALSE)
	unzip("lib.zip", exdir = "../windows")
	unlink("lib.zip")
}