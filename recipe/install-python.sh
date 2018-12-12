#!/bin/bash
#
# Build and install the Python bindings for the NDS2Client
#

set -ex
pushd ${SRC_DIR}/build

# switch between python major versions
ENABLEPY2="no"
ENABLEPY3="no"
[ "${PY3K}" -eq 1 ] && ENABLEPY3="yes" || ENABLEPY2="yes"

# configure
cmake ${SRC_DIR} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=yes \
  -DENABLE_SWIG_JAVA=no \
  -DENABLE_SWIG_MATLAB=no \
  -DENABLE_SWIG_OCTAVE=no \
  -DENABLE_SWIG_PYTHON2=${ENABLEPY2} \
  -DENABLE_SWIG_PYTHON3=${ENABLEPY3}

# build
cmake --build python -- -j ${CPU_COUNT}

# install
cmake --build python --target install

# test
ctest --extra-verbose --output-on-failure

# remove unnecessary testing files
rm -rvf ${PREFIX}/libexec/nds2-client
