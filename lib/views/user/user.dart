import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/forText/forText.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => new UserState();

}

class UserState extends State<User> with SingleTickerProviderStateMixin {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text('测试'),
      Text('用户中心'),
      ForText(),
    ],);
  }
}