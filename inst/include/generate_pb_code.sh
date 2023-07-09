#generate pb code
../../src/pb_build/bin/protoc --cpp_out=cytolib/ GatingSet.proto
#move the source to src
mv cytolib/GatingSet.pb.cc ../../src/GatingSet_pb_lib/
#update the include path to header
sed -i 's+"GatingSet.pb.h"+<cytolib/GatingSet.pb.h>+g' ../../src/GatingSet_pb_lib/GatingSet.pb.cc
