#!/bin/bash

mkdir -p build
cd build
cmake .. -DCOMPILE_GUI=1
make
cd ..
