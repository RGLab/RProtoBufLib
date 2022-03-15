# Process this file with autoconf to produce a configure script.
# author: Mike Smith (mike.smith@embl.de)

AC_PREREQ([2.65])
AC_INIT([RProtoBufLib], [0.99.0], [mike@ozette.ai])
AC_CONFIG_SRCDIR([src])

# Check the compiler configured with R
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi

CC=`"${R_HOME}/bin/R" CMD config CC`
CFLAGS=`"${R_HOME}/bin/R" CMD config CFLAGS`
MAKE=`${R_HOME}/bin/R CMD config MAKE`
CXX=`"${R_HOME}/bin/R" CMD config CXX`
CXXFLAGS=`"${R_HOME}/bin/R" CMD config CXXFLAGS`
F77=`"${R_HOME}/bin/R" CMD config F77`
AC_LANG(C++)

# Checks for programs.
AC_PROG_CC
AC_PROG_CXX

#untar the lib
BASEPBNAME="protobuf-3.13.0"
PBTGZNAME=${BASEPBNAME}.tar.gz
cd src
if test -d ./${BASEPBNAME}; then 
	echo 'found ' $BASEPBNAME ' header sources and tar archive;using what is there.'
else
	echo "untarring protobuf ...";
	gzip -dc ${PBTGZNAME} | tar -xf -
fi;

#run this bootstrap script to update all the gnu auto build files (e.g.  automake symlinked fils (e.g. ./compile), alocal.m4,etc... )		
cd ${BASEPBNAME}
#./autogen.sh
#automake --add-missing #do this because the old Autoconf (e.g. 2.13) may not handle this in autoreconf
#mv m4/lt~obsolete.m4 m4/lt-obsolete.m4 # R CMD check gives warning about ~ character in filename 
cd ..

echo "building protobuf...";
PBBUILD=$(pwd)/pb_build
if test -d ${PBBUILD}; then
	echo 'found ' $PBBUILD ' ;using what is there.'
else
	mkdir ${PBBUILD}
fi;

cd ${BASEPBNAME};
./configure --enable-static=no --with-pic=yes --enable-shared=yes --prefix="${PBBUILD}" --libdir="${PBBUILD}/lib" CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" CC="${CC}" CFLAGS="${CFLAGS}"
$MAKE install 

cd ../../



AC_SUBST(PBBUILD)
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT

