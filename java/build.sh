#!/bin/bash

SOURCEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build collector

pushd ../collector || exit
make package
popd || exit

# Build the sdk layer

./gradlew :layer-wrapper:build

# Combine the layers

pushd ./layer-wrapper/build/distributions || exit
unzip -qo opentelemetry-java-wrapper.zip
rm opentelemetry-java-wrapper.zip
unzip -qo ../../../../collector/build/collector-extension.zip
zip -qr opentelemetry-java-wrapper.zip *
popd || exit
