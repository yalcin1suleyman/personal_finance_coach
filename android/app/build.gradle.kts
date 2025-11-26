plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.yalcinstudio.personal_finance_coach"

    // Flutter'dan gelen compileSdk kalsın
    compileSdk = flutter.compileSdkVersion

    // NDK'yi sabit 27.0.12077973 yapıyoruz
    ndkVersion = "27.1.12297006"


    defaultConfig {
        applicationId = "com.yalcinstudio.personal_finance_coach"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }


    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}


flutter {
    source = "../.."
}
dependencies {
    // Java 8+ API'ler için zorunlu desugaring dependency
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}
