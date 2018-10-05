#!/bin/bash
#
# Build and install the Python bindings for the NDS2Client

set -x
source activate ${PREFIX}
cd ${SRC_DIR}/build

if [ "${PY3K}" -eq 1 ]; then
	_PYTHON_BUILD_OPTS="-DENABLE_SWIG_PYTHON2=no -DENABLE_SWIG_PYTHON3=yes -DPYTHON3_EXECUTABLE=${PYTHON}"
else
	_PYTHON_BUILD_OPTS="-DENABLE_SWIG_PYTHON3=no -DENABLE_SWIG_PYTHON2=yes -DPYTHON2_EXECUTABLE=${PYTHON}"
fi

cmake .. \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_PREFIX_PATH=${PREFIX}/bin \
	-DWITH_SASL=${PREFIX} \
	-DWITH_GSSAPI=no \
	-DENABLE_SWIG_JAVA=false \
	-DENABLE_SWIG_MATLAB=false \
	-DENABLE_SWIG_OCTAVE=false \
	${_PYTHON_BUILD_OPTS}
cmake --build python --config Release -- -j ${CPU_COUNT}
ctest -V
cmake --build python --target install
