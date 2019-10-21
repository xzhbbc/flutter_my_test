import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/stateItem/stateItem.dart';
import 'package:my_flutter_app/components/textTitle/testTitle.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => new AboutState();
}

class AboutState extends State<About> with SingleTickerProviderStateMixin {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text('测试'),
      Text('关于'),
      TestTitle(),
      StateItem(title: '测试组件按钮'),
    ],);
  }
}

