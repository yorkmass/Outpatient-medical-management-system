package com.example.administrator.myapplication

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.KeyEvent
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Toast
import com.example.administrator.myapplication.R.id.web1

class Main2Activity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)
        val web1=findViewById<WebView>(R.id.web1)
        web1.settings.javaScriptEnabled=true
        web1.settings.javaScriptCanOpenWindowsAutomatically=true
        web1.settings.domStorageEnabled=true
        web1.settings.allowFileAccess=true
        web1.settings.cacheMode= WebSettings.LOAD_NO_CACHE
//web1.settings.setAppCacheEnabled(true)
        web1.webViewClient= WebViewClient()
        web1.loadUrl("http://xh.studiosworks.cn")
        getSupportActionBar()?.hide()

    }



}
