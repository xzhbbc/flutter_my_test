import 'package:flutter/material.dart';
import 'package:my_flutter_app/providers/data_info.dart';
import 'package:provider/provider.dart';

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Consumer<DataInfo>(
          builder: (context, dataInfo, _) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('测试Provider'),
                  Text((dataInfo.count).toString()),
                  FlatButton(
                    onPressed: () => {dataInfo.subCount()},
                    child: Text('减少'),
                  ),
                ],
              )),
    ));
  }
}
