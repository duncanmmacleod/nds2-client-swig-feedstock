#!/bin/bash
#
# Build the common SWIG Interface libraries for the NDS2Client

mkdir -p build
pushd build

cmake .. \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_PREFIX_PATH=${PREFIX}/bin \
	-DWITH_SASL=${PREFIX} \
	-DWITH_GSSAPI=no \
	-DENABLE_SWIG_JAVA=false \
	-DENABLE_SWIG_MATLAB=false \
	-DENABLE_SWIG_OCTAVE=false \
	-DENABLE_SWIG_PYTHON2=false \
	-DENABLE_SWIG_PYTHON3=false

cmake --build common --config Release -- -j${CPU_COUNT}
ctest -V
