package com.example.flutter_app;

import android.app.Application;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

/**
 * @Date: 2022/4/22
 * @Time: 15:48
 * @Author: Jian
 */
public class MyApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        // Somewhere in your app, before your FlutterFragment is needed,
        // like in the Application class ...
        // Instantiate a FlutterEngine.
        FlutterEngine flutterEngine = new FlutterEngine(MyApplication.this);

        // Start executing Dart code in the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the pre-warmed FlutterEngine to be used later by FlutterFragment.
        FlutterEngineCache
                .getInstance()
                .put("ImageRoute", flutterEngine);
    }
}
