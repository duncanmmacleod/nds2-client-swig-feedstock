#!/bin/bash
#
# Build and install the Python bindings for the NDS2Client

set -ex
pushd ${SRC_DIR}/build

if [ "${PY3K}" -eq 1 ]; then
  _PYTHON_BUILD_OPTS="-DENABLE_SWIG_PYTHON2=no -DENABLE_SWIG_PYTHON3=yes"
else
  _PYTHON_BUILD_OPTS="-DENABLE_SWIG_PYTHON3=no -DENABLE_SWIG_PYTHON2=yes"
fi

# configure
cmake .. \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DWITH_SASL=${PREFIX} \
  -DWITH_GSSAPI=no \
  -DENABLE_SWIG_JAVA=no \
  -DENABLE_SWIG_MATLAB=no \
  -DENABLE_SWIG_OCTAVE=no \
  -DPYTHON=${PYTHON} \
  -DPYTHON_EXECUTABLE=${PYTHON} \
  ${_PYTHON_BUILD_OPTS}

# build
cmake --build python -- -j ${CPU_COUNT}

# install
cmake --build python --target install

# test
ctest -V

# remove unnecessary testing files
rm -rvf ${PREFIX}/libexec/nds2-client
