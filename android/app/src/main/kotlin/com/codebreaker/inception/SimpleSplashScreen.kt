package com.codebreaker.inception

import android.content.Context
import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.SplashScreen

class SimpleSplashScreen : SplashScreen {
    override fun createSplashView(context: Context, p1: Bundle?): View? {
        return MySplashView(context)
    }

    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        onTransitionComplete.run()
    }
}