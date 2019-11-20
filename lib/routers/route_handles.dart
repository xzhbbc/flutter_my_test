import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/ReduxTextPage_page/page.dart';
import 'package:my_flutter_app/views/about/about.dart';
import 'package:my_flutter_app/views/firstPage/firstPage.dart';
import 'package:my_flutter_app/views/home/home.dart';
import 'package:my_flutter_app/views/homePage/user.dart';
import 'package:my_flutter_app/views/movieDetail/movieDetail.dart';
import 'package:my_flutter_app/views/secondPage/secondPage.dart';

var appHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return AppPage();
});

var firstHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return FirstPage();
});

var aboutHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return About();
});

var userHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return User();
});

var secondPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SecondPage();
});

var reduxPageHandle = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return ReduxTextPagePage().buildPage(null);
});

var movieDetailHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String ids = params["id"]?.first;
    String title = params["title"]?.first;
    String type = params["type"]?.first;
    String img = params["img"]?.first;
    // print(params['id']);
    return new MovieDetail(id: ids,title: title, type: type, img: img,);
  }
);