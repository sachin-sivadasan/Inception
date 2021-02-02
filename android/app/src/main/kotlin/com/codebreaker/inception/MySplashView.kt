package com.codebreaker.inception

import android.content.Context
import android.view.LayoutInflater
import android.widget.LinearLayout

class MySplashView : LinearLayout {

    constructor(context: Context): super(context) {
        init(context)
    }

    private fun init(context: Context) {
        LayoutInflater.from(context).inflate(R.layout.splash, this)
    }
}