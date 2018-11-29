#!/bin/bash
#
# Build the common SWIG Interface libraries for the NDS2Client

mkdir -p build
pushd build

cmake .. \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DWITH_SASL=${PREFIX} \
  -DWITH_GSSAPI=no \
  -DENABLE_SWIG_JAVA=no \
  -DENABLE_SWIG_MATLAB=no \
  -DENABLE_SWIG_OCTAVE=no \
  -DENABLE_SWIG_PYTHON2=no \
  -DENABLE_SWIG_PYTHON3=no \
  -DPYTHON=false \
  -DPYTHON_EXECUTABLE=false

cmake --build common --config Release -- -j${CPU_COUNT}
