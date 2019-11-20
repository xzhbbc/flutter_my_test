import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/routers/routers.dart';
import '../routers/application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  // 测试页
  static void goSecondPage(BuildContext context) {
    _navigateTo(context, Routes.second);
  }

  // 电影详情 + '/:ids/:title/:type'
  static void goMovieDetail(
    BuildContext context, {
    @required String id,
    @required String title,
    @required String type,
    @required String img,
  }) {
    _navigateTo(context,
        "${Routes.movieDetail}?id=${Uri.encodeComponent(id)}&title=${Uri.encodeComponent(title)}&type=${Uri.encodeComponent(type)}&img=${Uri.encodeComponent(img)}");
  }
}
