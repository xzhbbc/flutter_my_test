package com.example.my_flutter_app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.idlefish.flutterboost.containers.NewBoostFlutterActivity;

import java.util.HashMap;
import java.util.Map;

import io.flutter.Log;

public class PageRouter {

    public final static Map<String, String> pageName = new HashMap<String, String>() {{


        put("first", "first");
        put("second", "second");
//        put("tab", "tab");
//
//        put("sample://flutterPage", "flutterPage");
    }};

    public static final String NATIVE_FIRST_PAGE_URL = "flutterbus://nativeFirstPage";
    public static final String NATIVE_SECOND_PAGE_URL = "flutterbus://nativeSecondPage";
    public static final String FLUTTER_FIRST_PAGE_URL = "flutterbus://flutterFirstPage";
    public static final String FLUTTER_SECOND_PAGE_URL = "flutterbus://flutterSecondPage";

    public static boolean openPageByUrl(Context context, String url) {
        return openPageByUrl(context, url, 0);
    }

    public static boolean openPageByUrl(Context context, String url, int requestCode) {
        String path = url.split("\\?")[0];

        Log.d("openPageByUrl",path);

        try {
            Intent intent;
            if (pageName.containsKey(path)) {
                Log.d("openPageByUr111l",pageName.get(path));
                intent = NewBoostFlutterActivity.withNewEngine().url(pageName.get(path))
                        .backgroundMode(NewBoostFlutterActivity.BackgroundMode.opaque).build(context);

                context.startActivity(intent);
                return true;
            } else if (url.startsWith(NATIVE_FIRST_PAGE_URL)) {
                intent = new Intent(context, FlutterPageActivity.class);
                intent.putExtra("url", url);
                context.startActivity(intent);
                return true;
            } else if(url.startsWith(FLUTTER_FIRST_PAGE_URL)) {
                intent = new Intent(context, MainActivity.class);
                intent.putExtra("url", url);
                context.startActivity(intent);
                return true;
            } else {
                return false;
            }
        } catch (Throwable t) {
            Log.d("fail",path);
            return false;
        }
    }
}
