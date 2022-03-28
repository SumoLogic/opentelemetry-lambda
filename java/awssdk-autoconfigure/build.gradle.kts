// TODO(anuraaga): Move this into instrumentation repo

plugins {
    `java-library`
}

base.archivesBaseName = "opentelemetry-lambda-awsdk-autoconfigure"

dependencies {
    compileOnly("io.opentelemetry:opentelemetry-api:1.12.0")
    compileOnly("software.amazon.awssdk:aws-core")

    implementation("io.opentelemetry.instrumentation:opentelemetry-aws-sdk-2.2:1.12.1-alpha")
}
