package com.example.flutter_notas_3capas_app

import androidx.multidex.MultiDexApplication
import io.flutter.app.FlutterApplication
import io.flutter.plugins.GeneratedPluginRegistrant

class CustomApplication : MultiDexApplication() {
    override fun onCreate() {
        super.onCreate()
        GeneratedPluginRegistrant.registerWith(this)
    }
}
