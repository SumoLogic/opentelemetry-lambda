#!/bin/bash

SOURCEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build collector

pushd ../collector || exit
make package
popd || exit

# Build sdk layer

cd ./src || exit
./build.sh

# Combine the layers
cd ./build || exit

unzip -qo layer.zip
rm layer.zip

unzip -qo ../../../collector/build/collector-extension.zip

zip -qr opentelemetry-python.zip *
