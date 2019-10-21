import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/about/about.dart';
import 'package:my_flutter_app/views/firstPage/firstPage.dart';
import 'package:my_flutter_app/views/user/user.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage> with SingleTickerProviderStateMixin {

    String appBarTitle;
    int _currentIndex = 0;
    List<Widget> _list = List();
    List tabData = [
      {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
      {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
      {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
      //https://flutter-go.pub/api/isInfoOpen
    ];
    List<BottomNavigationBarItem> _myTabs = [];

    void initState() {
      super.initState();
      appBarTitle = tabData[0]['text'];

      for (int i = 0; i < tabData.length; i++) {
        _myTabs.add(BottomNavigationBarItem(
          icon: tabData[i]['icon'],
          title: Text(
            tabData[i]['text'],
          ),
        ));
      }

      _list
        ..add(FirstPage())
        ..add(About())
        ..add(User());
    }
    

    renderAppBar(BuildContext context, Widget widget, int index) {
      return AppBar(title: Text(tabData[index]['text']));
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: renderAppBar(context, widget, _currentIndex),
        body: IndexedStack(
          index: _currentIndex,
          children: _list,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _myTabs,
          //高亮  被点击高亮
          currentIndex: _currentIndex,
          //修改 页面
          onTap: _itemTapped,
          //shifting :按钮点击移动效果
          //fixed：固定
          type: BottomNavigationBarType.fixed,

          fixedColor: Theme.of(context).primaryColor,
        ),
      );
    }

    void _itemTapped(int index) {
      setState(() {
        _currentIndex = index;
        appBarTitle = tabData[index]['text'];
      });
    }
  }