#!/bin/bash

set -e

source activate "${PREFIX}"
cd ${SRC_DIR}/build

cmake --build common --target install
