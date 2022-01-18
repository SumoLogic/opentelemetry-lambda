#!/bin/bash

OFFICIAL_LAYER_NAME="sumologic-aws-distro-otel-col-nodejs-lambda-layer"
ARCHITECTURE_AMD="x86_64"
ARCHITECTURE_ARM="arm64"
RUNTIMES="nodejs12.x nodejs14.x"
DESCRIPTION="Sumo Logic AWS Distro OTel Collector and NodeJS Lambda Layer
https://github.com/SumoLogic/opentelemetry-lambda/tree/main/nodejs"
LICENSE="Apache-2.0"


# Set architecture
ARCH=$1

if [[ $ARCH == "amd64" ]];
then
    ARCHITECTURE=${ARCHITECTURE_AMD}
elif [[ $ARCH == "arm64" ]];
then
    ARCHITECTURE=${ARCHITECTURE_ARM}
fi

echo "Architecture - ${ARCHITECTURE}"

# Set layer name
DEV_LAYER=$2

if [ -z "$DEV_LAYER" ];
then
    LAYER_NAME=${OFFICIAL_LAYER_NAME}
else
    LAYER_NAME=$DEV_LAYER
fi
echo "Layer name - ${LAYER_NAME}"

# Create S3 Bucket
BUCKET_NAME=$3
echo "Creating bucket - ${BUCKET_NAME}"

aws s3 mb s3://${BUCKET_NAME}

# Copying layer archive to S3 bucket
LAYER_ARCHIVE=$4
BUCKET_KEY=$5
echo "Copy layer archive to S3 bucket"
echo "Bucket key - ${BUCKET_KEY}"
aws s3 cp ${LAYER_ARCHIVE} s3://${BUCKET_NAME}/${BUCKET_KEY}

# Create Lambda Layer
echo "Create Lambda Layer..."
aws lambda publish-layer-version --layer-name "${LAYER_NAME}-${ARCHITECTURE}" --content S3Bucket=${BUCKET_NAME},S3Key=${BUCKET_KEY} --compatible-runtimes ${RUNTIMES} --compatible-architectures ${ARCHITECTURE} --description "${DESCRIPTION}" --license-info "${LICENSE}"
