package com.example.my_flutter_app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

public class PageRouter {
    public static final String NATIVE_FIRST_PAGE_URL = "flutterbus://nativeFirstPage";
    public static final String NATIVE_SECOND_PAGE_URL = "flutterbus://nativeSecondPage";
    public static final String FLUTTER_FIRST_PAGE_URL = "flutterbus://flutterFirstPage";
    public static final String FLUTTER_SECOND_PAGE_URL = "flutterbus://flutterSecondPage";

    public static boolean openPageByUrl(Context context, String url) {
        return openPageByUrl(context, url, 0);
    }

    public static boolean openPageByUrl(Context context, String url, int requestCode) {
        try {
            Intent intent;
            if (url.startsWith(NATIVE_FIRST_PAGE_URL)) {
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
            return false;
        }
    }
}
