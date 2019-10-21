import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/about/about.dart';
import 'package:my_flutter_app/views/firstPage/firstPage.dart';
import 'package:my_flutter_app/views/home/home.dart';
import 'package:my_flutter_app/views/secondPage/secondPage.dart';
import 'package:my_flutter_app/views/user/user.dart';

class Routes {
  static String root = "/";
  static String widget = "/widget";
  static String user = "/user";
  static String about = "/about";
  static String second = '/second';

  static void configureRoutes(Router router) {
    router.define(root, handler: Handler(handlerFunc: (context, params) => AppPage()));
    router.define(widget, handler: Handler(handlerFunc: (context, params) => FirstPage()));
    router.define(about, handler: Handler(handlerFunc: (context, params) => About()));
    router.define(user, handler: Handler(handlerFunc: (context, params) => User()));
    router.define(second, handler: Handler(handlerFunc: (context, params) => SecondPage()));
  }
}