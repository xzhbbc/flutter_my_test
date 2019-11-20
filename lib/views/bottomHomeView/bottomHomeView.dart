import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_app/routers/application.dart';
import 'package:my_flutter_app/views/homePage/home.dart';
import 'package:my_flutter_app/views/homePage/news.dart';
import 'package:my_flutter_app/views/homePage/user.dart';

class BottomHomeView extends StatefulWidget {
  BottomHomeView({Key key}) : super(key: key);

  @override
  BottomHomeViewState createState() => BottomHomeViewState();
}

class BottomHomeViewState extends State<BottomHomeView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;

  List colors = [Colors.blue, Colors.pink, Colors.orange];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: colors[currentIndex],
          index: currentIndex,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.fiber_new, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            setState(() {
              currentIndex = index;
            });
            tabController.animateTo(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              color: colors[0],
              child: HomePage(),
            ),
            Container(
              color: colors[1],
              child: News(),
            ),
            Container(
              color: colors[2],
              child: User(),
            )
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
