import 'package:fluro/fluro.dart';
import './route_handles.dart';

class Routes {
  static String root = "/";
  static String widget = "/widget";
  static String user = "/user";
  static String about = "/about";
  static String second = '/second';
  static String reduxPage = '/reduxPage';
  static String movieDetail = '/movieDetail';

  static void configureRoutes(Router router) {
    router.define(root, handler: appHandler);
    router.define(widget, handler: firstHandler);
    router.define(about, handler: aboutHandler);
    router.define(user, handler: userHandler);
    router.define(second, handler: secondPageHandler);
    router.define(reduxPage, handler: reduxPageHandle);
    router.define(movieDetail, handler: movieDetailHandler);
  }
}