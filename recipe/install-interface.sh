#!/bin/bash
#
# Install with cmake; the package configuration and build has
# already been completed in build.sh
#

set -e
pushd ${SRC_DIR}/build

# test
ctest --extra-verbose --output-on-failure

# install
cmake --build . --target install
