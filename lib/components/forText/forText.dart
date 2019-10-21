import 'package:flutter/material.dart';

class ForText extends StatefulWidget {
  @override
  ForTextState createState() => ForTextState();
}

class ForTextState extends State<ForText>{

  List formList;
  initState() {
    super.initState();
    formList = [
      {"icon": Icon(Icons.alarm),"title": '车牌号'},
      {"icon": Icon(Icons.album),"title": '所有人'},
      {"icon": Icon(Icons.archive),"title": '号牌颜色'},
    ];
  }
  Widget buildGrid() {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in formList) {
      tiles.add(
          new Row(
              children: <Widget>[
                item['icon'],
                new Text(item['title']),
              ]
          )
      );
    }
    content = new Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: buildGrid(),
    );
  }

}