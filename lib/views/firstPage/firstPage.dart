import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:my_flutter_app/routers/application.dart';
import 'package:my_flutter_app/routers/routers.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  int testNum;

  void initState() {
    super.initState();
    testNum = 10;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              margin: EdgeInsets.only(top: 10),
              child: PageView(
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    child: Center(
                      child: Text(
                        "这是一个PageView事例",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "这是一个PageView事例",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "这是一个PageView事例",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "这是一个PageView事例",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // 列数
                  crossAxisCount: 3,
                  // 列间距
                  mainAxisSpacing: 10.0,
                  // 横轴距离
                  crossAxisSpacing: 4.0,
                  // 缩放比例
                  childAspectRatio: 1.3,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
//                      print('${Application.router}');
                      // Application.router.navigateTo(context, '${Routes.second}',
                      //     transition: TransitionType.nativeModal);
                      // Fl
                      FlutterBoost.singleton
                          .open("flutterbus://nativeFirstPage");
                    },
                    child: Image.network(
                      'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                      scale: 1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201604/23/20160423185321_K2ueY.jpeg',
                    scale: 1,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Container(
              height: 400,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // 列数
                  crossAxisCount: 3,
                  // 列间距
                  mainAxisSpacing: 10.0,
                  // 横轴距离
                  crossAxisSpacing: 4.0,
                  // 缩放比例
                  childAspectRatio: 1.3,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                children: <Widget>[
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'http://pic25.nipic.com/20121126/5765376_160224280175_2.jpg',
                    scale: 1,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
