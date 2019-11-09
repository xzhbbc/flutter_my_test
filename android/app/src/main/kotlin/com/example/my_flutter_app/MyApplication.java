package com.example.my_flutter_app;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import com.idlefish.flutterboost.FlutterBoostPlugin;
import com.idlefish.flutterboost.NewFlutterBoost;
import com.idlefish.flutterboost.Platform;
import com.idlefish.flutterboost.interfaces.INativeRouter;

import java.util.Map;

import io.flutter.app.FlutterApplication;


public class MyApplication extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
//        NewFlutterBoost.instance().init();

        INativeRouter router =new INativeRouter() {
            @Override
            public void openContainer(Context context, String url, Map<String, Object> urlParams, int requestCode, Map<String, Object> exts) {

                String  assembleUrl= com.idlefish.flutterboost.Utils.assembleUrl(url,urlParams);

                Log.d("TAG", assembleUrl);
                Log.d("tag", "openContainer: "
                            + url + "~"
                        + urlParams + "~"
                        + requestCode + "~"
                        + exts);
                PageRouter.openPageByUrl(context, url, requestCode);
            }
        };

        Platform platform= new NewFlutterBoost
                .ConfigBuilder(this,router)
                .isDebug(true)
                .whenEngineStart(NewFlutterBoost.ConfigBuilder.ANY_ACTIVITY_CREATED)
                .build();

        NewFlutterBoost.instance().init(platform);
    }
}
