#!/bin/bash
#
# Build the common SWIG Interface libraries for the NDS2Client
#

mkdir -p build
pushd build

cmake .. \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DENABLE_SWIG_JAVA=no \
  -DENABLE_SWIG_MATLAB=no \
  -DENABLE_SWIG_OCTAVE=no \
  -DENABLE_SWIG_PYTHON2=no \
  -DENABLE_SWIG_PYTHON3=no

cmake --build . -- -j${CPU_COUNT}
