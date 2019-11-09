import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_flutter_app/routers/application.dart';
import 'package:my_flutter_app/routers/routers.dart';
import 'package:my_flutter_app/utils/net_utils.dart';
import 'package:my_flutter_app/views/movieDetail/movieDetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  // AnimationController controller;
  // Animation<double> animation;
  String title;
  List cardList;

  void initState() {
    super.initState();
    title = '正在获取数据中...';
    // 定义动画控制器
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 200),
    // );
    // // 定义动画
    // animation = Tween<double>(begin: 1, end: 0.98).animate(controller);
    getData();
  }

  Future getData() async {
    const url = 'http://192.168.10.52:3002/movie/get';
    var response;
    try {
      response = await NetUtils.get(url);
      // print(response);
      if (response['code'] == 1) {
        setState(() {
          title = response['data']['title'];
          cardList = response['data']['subjects'];
        });
      }
    } catch (e) {
      print('response-$e');
    }
    return response;
  }

  List<Widget> buildCardList() {
    List<Widget> cardListWidget = []; //先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    if (cardList == null) {
      cardListWidget.add(Container(
        child: Text('暂无数据'),
      ));
      return cardListWidget;
    };
    for (int i = 0; i < cardList.length; i++) {
      String typeMeg = '';
      String img = '';
      if (cardList[i]['genres'] != null) {
        if (cardList[i]['genres'] is List) {
          var typeList = cardList[i]['genres'];
          for (int j = 0; j < typeList.length; j++) {
            if (typeMeg == '') {
              typeMeg += typeList[j];
            } else {
              typeMeg += ' ' + typeList[j];
            }
          }
          cardList[i]['type'] = typeMeg;
        }
      }
      if (cardList[i]['images'] != null) {
        var smImg = cardList[i]['images']['small'];
        if (smImg != null && smImg != '') {
          img = smImg;
        }
      }
      cardList[i]['img'] = img;
      var controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      );
      var animation = Tween<double>(begin: 1, end: 0.98).animate(controller);
      cardListWidget.add(GestureDetector(
        onPanDown: (details) {
          // print('onPanDown');
          controller.forward(); // 点击的时候播放动画
        },
        onPanCancel: () {
          // print('onPanCancel');
          controller.reverse(); // cancel的时候回弹动画
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MovieDetail(
                id: cardList[i]['id'],
                title: cardList[i]['title'],
                type: cardList[i]['type'],
                img: cardList[i]['img'],
              ),
              // settings: RouteSettings(isInitialRoute: true),
              fullscreenDialog: true,
            ),
          );
          // Application.router.navigateTo(context,
          //     '${Routes.movieDetail}/${cardList[i]['id']}/${cardList[i]['title']}/${cardList[i]['type']}',
          //     );
        },
        child: ScaleTransition(
            scale: animation,
            child: Hero(
              tag: 'hero${cardList[i]['id']}',
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                margin: const EdgeInsets.all(5),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: new Text(
                        cardList[i]['title'],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        '分类：$typeMeg',
                        style: TextStyle(color: Colors.yellow, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          img,
                          fit: BoxFit.contain,
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            )),
      ));
    }
    // content = new Column(children: cardListWidget);
    // content = new Padding(
    //   padding: const EdgeInsets.only(bottom: 30),
    //   child: content,
    // );
    return cardListWidget;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          height: 200,
          child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "http://pic34.nipic.com/20131030/2455348_194508648000_2.jpg",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 10,
              itemWidth: MediaQuery.of(context).size.width - 50,
              itemHeight: 200.0,
              layout: SwiperLayout.TINDER,
              scrollDirection: Axis.vertical),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  width: 150,
                  height: 5,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    //设置四周边框
                    border: new Border.all(width: 1, color: Colors.white),
                  )),
            ],
          ),
        ),
        // buildCardList()
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 13),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 列数
                crossAxisCount: 1,
                // 列间距
                mainAxisSpacing: 20.0,
                // 横轴距离
                crossAxisSpacing: 4.0,
                // 缩放比例
                childAspectRatio: 1,
              ),
              children: buildCardList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
