#!/bin/bash
#
# Install with cmake; the package configuration and build has
# already been completed in build.sh
#

set -e
pushd ${SRC_DIR}/build
cmake --build . --target install
