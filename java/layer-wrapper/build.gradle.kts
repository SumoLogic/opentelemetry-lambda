plugins {
    `java-library`
}

dependencies {
    runtimeOnly(project(":awssdk-autoconfigure"))

    runtimeOnly("io.opentelemetry.instrumentation:opentelemetry-aws-lambda-events-2.2:1.12.1-alpha")
    runtimeOnly("io.opentelemetry:opentelemetry-exporter-logging:1.12.0")
    runtimeOnly("io.opentelemetry:opentelemetry-exporter-otlp:1.12.0")
    runtimeOnly("io.opentelemetry:opentelemetry-extension-trace-propagators:1.12.0")
    runtimeOnly("io.opentelemetry:opentelemetry-sdk-extension-autoconfigure:1.12.0-alpha")
    runtimeOnly("io.opentelemetry:opentelemetry-sdk-extension-aws:1.12.0")
}

tasks {
    val createLayer by registering(Zip::class) {
        archiveFileName.set("opentelemetry-java-wrapper.zip")
        destinationDirectory.set(file("$buildDir/distributions"))

        from(configurations["runtimeClasspath"]) {
            into("java/lib")
        }

        // Can be used by redistributions of the wrapper to add more libraries.
        from("build/extensions") {
            into("java/lib")
        }

        from("scripts")
    }

    val assemble by existing {
        dependsOn(createLayer)
    }
}
