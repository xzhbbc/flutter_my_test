import 'package:flutter/material.dart';

class StateItem extends StatefulWidget {
  StateItem({Key key, this.title}) : super(key: key);

  final title;

  @override
  StateItemState createState() => StateItemState();
}

class StateItemState extends State<StateItem> {
  int count = 1;

  void addCount() {
    setState(() {
      count++;
    });
  }

  void subCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(widget.title),
        Text('计算：$count'),
        FlatButton(
          child: Text('add'),
          color: Colors.blue,
          colorBrightness: Brightness.dark,
          disabledColor: Colors.grey,
          textTheme: ButtonTextTheme.normal,
          splashColor: Colors.deepPurple,
          clipBehavior: Clip.antiAlias,
          onPressed: addCount,
        ),
        FlatButton(
          child: Text('sub'),
          color: Colors.green,
          colorBrightness: Brightness.dark,
          disabledColor: Colors.grey,
          textTheme: ButtonTextTheme.normal,
          splashColor: Colors.deepPurple,
          clipBehavior: Clip.antiAlias,
          onPressed: subCount,
        ),
      ],
    );
  }

}