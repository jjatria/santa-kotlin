// build.gradle.kts
plugins {
    kotlin("multiplatform") version "1.9.21"
}

repositories {
    mavenCentral()
}

kotlin {
    // macosX64("native") // on macOS
    // mingwX64("native") // on Windows

    linuxX64("native") { // on Linux
        binaries {
            sharedLib {
                baseName = "example"
            }
        }
    }
}

tasks.wrapper {
    gradleVersion = "8.1.1"
    distributionType = Wrapper.DistributionType.ALL
}
