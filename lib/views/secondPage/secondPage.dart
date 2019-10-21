import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();

}

class SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text('测试页')),
      body: Center(
        child: Text('测试页的一个'),
      ),
    );
  }
}