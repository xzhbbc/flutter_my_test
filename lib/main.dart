import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_app/providers/data_info.dart';
import 'package:my_flutter_app/routers/application.dart' show Application;
import 'package:my_flutter_app/routers/routers.dart';
import 'package:my_flutter_app/utils/net_utils.dart';
import 'package:my_flutter_app/views/bottomHomeView/bottomHomeView.dart';
import 'package:my_flutter_app/views/flutterBoost/firstRouteWidget.dart';
import 'package:my_flutter_app/views/flutterBoost/secondRouteWidget.dart';
import 'package:my_flutter_app/views/home/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(builder: (context) => DataInfo(), child: MyApp()));
// void main() => runApp(
//   MultiProvider(providers: [
//     ChangeNotifierProvider(
//       builder: (context) => DataInfo()
//     )
//   ],child: MyApp(),)
// );

class MyApp extends StatefulWidget {
  // This firstPage is the root of your application.
  // MyApp() {
  //   final router = new Router();
  //   Routes.configureRoutes(router);
  //   // 这里设置项目环境
  //   Application.router = router;
  // }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NetUtils.init();
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstRouteWidget(),
      'second': (pageName, params, _) => SecondRouteWidget(),
      // 'flutterPage': (pageName, params, _) {
      //     print("flutterPage params:$params");

      //     return FlutterRouteWidget(params:params);
      // },
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      builder: FlutterBoost.init(),
      home: new Scaffold(
        body: AppPage(),
      ),
      // onGenerateRoute: Application.router.generator,
    );
  }
  //  BottomHomeView(),
  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
    print(pageName);
  }
}

class BottomNavigationBarFullDefault extends StatefulWidget {
  const BottomNavigationBarFullDefault() : super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarFullDefault();
  }
}

// NavigationBar 默认实例,有状态
class _BottomNavigationBarFullDefault extends State {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24.0,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      fixedColor: Colors.deepPurple,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('List'),
          icon: Icon(Icons.list),
        ),
        BottomNavigationBarItem(
          title: Text('Message'),
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          title: Text('add'),
          icon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          title: Text('menu'),
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
