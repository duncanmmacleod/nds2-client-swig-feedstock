#!/bin/bash

set -e
pushd ${SRC_DIR}/build
cmake --build common --target install
