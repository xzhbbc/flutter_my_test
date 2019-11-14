import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final id;
  final title;
  final type;
  final img;
  MovieDetail({Key key, this.id, this.title, this.type, this.img})
      : super(key: key);

  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${widget.title}'),
      // ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Hero(
            tag: "hero${widget.id}", //唯一标记，前后两个路由页Hero的tag必须相同
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20.0,
              margin: const EdgeInsets.all(5),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 20),
                    title: new Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: new Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    subtitle: new Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '分类：${widget.type}',
                        style: TextStyle(color: Colors.yellow, fontSize: 16),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: new Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Image.network(
                        widget.img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "有些观众会觉得《你名》中不断地重复讲述与询问“你叫什么名字”有点过度渲染，实际上当你深入了解“名字”的意义时，也就不会这样觉得了。细想，有不少二次元的故事都与名字有关，只不过没有像《你名》这样表达的如此明显。从《千与千寻》中，被剥夺名字的千寻和白龙，到《夏目友人帐》中留名便表示服从的妖怪们，名字似乎可以代表一个人的全部内在。甚至在看似只是斗智斗勇的机战片《反叛的鲁鲁修》中，女王ＣＣ的名字也一直是个隐藏的关键点。将“名字”归还妖怪的夏目你可能觉得夸张。别说，事实还真是这么夸张。由Madhouse出品浦泽直树原作的长篇动漫《怪物》里，对于“名字”的刻画更是比上面几部作品都要深刻。《怪物》中的激进分子为了为作为试验品的孩子们进行洗脑教育，第一步便是剥夺他们的名字，让他们不知道自己是谁。被剥夺名字的孩子们，心理发展出现畸形，或变成杀戮机器，或变成行尸走肉，共同点都是随着名字的消失而失去作为“人”的基本情感。这是一个人失去名字后内在的改变。作品中也有一个桥段，是当一个老兵意识到所有知道自己名字的人都已经去世后，感觉自己已经没有活着了。因为“名字”不仅仅是对自身内在情感与品质的一个容器，也是一个与他人建立联系、让自己存在于世界的一块基石。当容器消失了，基石消失了，那失去名字的那个人自己吗？这的确是一个有趣且无解的命题。",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            flightShuttleBuilder:
                (flightContext, animation, direction, fromContext, toContext) {
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                margin: const EdgeInsets.all(5),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 20),
                      title: new Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: new Text(
                          widget.title,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      subtitle: new Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '分类：${widget.type}',
                          style: TextStyle(color: Colors.yellow, fontSize: 16),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   child: new Padding(
                    //     padding: EdgeInsets.only(bottom: 10),
                    //     child: Image.network(
                    //       widget.img,
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    // new Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Text(
                    //     "有些观众会觉得《你名》中不断地重复讲述与询问“你叫什么名字”有点过度渲染，实际上当你深入了解“名字”的意义时，也就不会这样觉得了。细想，有不少二次元的故事都与名字有关，只不过没有像《你名》这样表达的如此明显。从《千与千寻》中，被剥夺名字的千寻和白龙，到《夏目友人帐》中留名便表示服从的妖怪们，名字似乎可以代表一个人的全部内在。甚至在看似只是斗智斗勇的机战片《反叛的鲁鲁修》中，女王ＣＣ的名字也一直是个隐藏的关键点。将“名字”归还妖怪的夏目你可能觉得夸张。别说，事实还真是这么夸张。由Madhouse出品浦泽直树原作的长篇动漫《怪物》里，对于“名字”的刻画更是比上面几部作品都要深刻。《怪物》中的激进分子为了为作为试验品的孩子们进行洗脑教育，第一步便是剥夺他们的名字，让他们不知道自己是谁。被剥夺名字的孩子们，心理发展出现畸形，或变成杀戮机器，或变成行尸走肉，共同点都是随着名字的消失而失去作为“人”的基本情感。这是一个人失去名字后内在的改变。作品中也有一个桥段，是当一个老兵意识到所有知道自己名字的人都已经去世后，感觉自己已经没有活着了。因为“名字”不仅仅是对自身内在情感与品质的一个容器，也是一个与他人建立联系、让自己存在于世界的一块基石。当容器消失了，基石消失了，那失去名字的那个人自己吗？这的确是一个有趣且无解的命题。",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
            transitionOnUserGestures: true,
          ),
        ),
      ),
    );
  }
}
