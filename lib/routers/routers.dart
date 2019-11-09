import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/ReduxTextPage_page/page.dart';
import 'package:my_flutter_app/views/about/about.dart';
import 'package:my_flutter_app/views/firstPage/firstPage.dart';
import 'package:my_flutter_app/views/home/home.dart';
import 'package:my_flutter_app/views/movieDetail/movieDetail.dart';
import 'package:my_flutter_app/views/secondPage/secondPage.dart';
import 'package:my_flutter_app/views/user/user.dart';

class Routes {
  static String root = "/";
  static String widget = "/widget";
  static String user = "/user";
  static String about = "/about";
  static String second = '/second';
  static String reduxPage = '/reduxPage';
  static String movieDetail = '/movieDetail';

  static void configureRoutes(Router router) {
    router.define(root, handler: Handler(handlerFunc: (context, params) => AppPage()));
    router.define(widget, handler: Handler(handlerFunc: (context, params) => FirstPage()));
    router.define(about, handler: Handler(handlerFunc: (context, params) => About()));
    router.define(user, handler: Handler(handlerFunc: (context, params) => User()));
    router.define(second, handler: Handler(handlerFunc: (context, params) => SecondPage()));
    router.define(reduxPage, handler: Handler(handlerFunc: (context, params) => ReduxTextPagePage().buildPage(null)));
    router.define(movieDetail + '/:ids/:title/:type', handler: movieDetailHandle);
  }
}

var movieDetailHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String ids = params["ids"]?.first;
    String title = params["title"]?.first;
    String type = params["type"]?.first;
    // print(params['id']);
    return new MovieDetail(id: ids,title: title, type: type,);
  }
);