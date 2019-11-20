import 'package:flutter/material.dart';
import 'package:my_flutter_app/providers/data_info.dart';
import 'package:my_flutter_app/utils/navigator_util.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<DataInfo>(
          builder: (context, dataInfo, _) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('测试Provider'),
                  Text((dataInfo.count).toString()),
                  FlatButton(
                    onPressed: () => {dataInfo.addCount()},
                    child: Text('增加'),
                  ),
                  FlatButton(
                    onPressed: () => {NavigatorUtil.goSecondPage(context)},
                    child: Text('跳转测试页'),
                  ),
                ],
              )),
    );
  }
}
