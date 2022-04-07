#!/bin/bash

SOURCEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build collector

pushd ../collector || exit
make package
popd || exit

# Build sdk layer
npm install

# Combine the layers
cd ./packages/layer/build/workspace || exit

rm ../layer.zip

unzip -qo ../../../../../collector/build/collector-extension.zip

ARCH=$1
zip -qr ../opentelemetry-nodejs-${ARCH}.zip *
