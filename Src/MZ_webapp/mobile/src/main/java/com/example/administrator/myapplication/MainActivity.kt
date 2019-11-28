package com.example.administrator.myapplication

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


    }
    fun buttonOpen(view: View){
        var intent= Intent("Main2Activity")//引号内是action名字
        startActivity(intent)
    }
}
