package com.example.my_flutter_app;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;

import com.idlefish.flutterboost.containers.NewBoostFlutterActivity;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class FlutterPageActivity extends NewBoostFlutterActivity {


    private int id = 0;
    private String name;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        if(intent != null) {
            String url = intent.getStringExtra("url");
//            Map map = UrlUtil.parseParams(url);
//            id = Integer.parseInt(map.get("id").toString());
//            name = map.get("name").toString();
        }
        setContentView(R.layout.activity_main);
    }

    @Override
    public String getContainerUrl() {
        return PageRouter.NATIVE_FIRST_PAGE_URL;
    }

    @Override
    public Map getContainerUrlParams() {
        return super.getContainerUrlParams();
    }

    //    @Override
//    public String getContainerName() {
//        return PageRouter.FLUTTER_FIRST_PAGE_URL;
//    }

//    @Override
//    public Map getContainerParams() {
//        Map map = new HashMap();
//        map.put("id", id);
//        map.put("name", name);
//        return map;
//    }
//
//    @Override
//    public void onRegisterPlugins(PluginRegistry registry) {
//        GeneratedPluginRegistrant.registerWith(registry);
//    }


    public void goToFlutter(View view) {
        PageRouter.openPageByUrl(this, "first");
    }
}
