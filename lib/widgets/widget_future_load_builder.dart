import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_app/widgets/widget_net_error.dart';

/// FutureBuilder 简单封装，除正确返回和错误外，其他返回 Loading
/// 错误时返回定义好的错误 Widget，例如点击重新请求
/// 提供loadingWidget，可以自行自定义
/// futureFunc 接口方法
/// params 接口参数
/// onHeaderRefresh 头部刷新回调
/// onHeaderRefresh 底部刷新回调
/// needItem 是否需要传递头项item或者末项item
/// buildItem 渲染的列表item
class LoadMoreFutureBuilder extends StatefulWidget {
  final Function futureFunc;
  final Map<String, dynamic> params;
  final Widget loadingWidget;
  final Function buildItem;
  final Function onHeaderRefresh;
  final Function onFooterRefresh;
  final bool needItem;

  LoadMoreFutureBuilder({
    @required this.futureFunc,
    @required this.buildItem,
    @required this.onHeaderRefresh,
    @required this.onFooterRefresh,
    this.needItem,
    this.params,
    Widget loadingWidget,
  }) : loadingWidget = loadingWidget ??
            Container(
              alignment: Alignment.center,
              height: ScreenUtil().setWidth(200),
              child: CupertinoActivityIndicator(),
            );

  @override
  _LoadMoreFutureBuilderState createState() => _LoadMoreFutureBuilderState();
}

class _LoadMoreFutureBuilderState extends State<LoadMoreFutureBuilder> {
  Future _future;
  String oldParams = '';
  List hotList = [];
  bool isLatese = false;
  bool isReflash = true;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _future = _request('');
    _controller.addListener(() {
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // print(hotList[hotList.length - 1]);
        if (isReflash) {
          isReflash = false;
          if (widget.needItem != null && widget.needItem) {
            widget.onFooterRefresh(hotList[hotList.length - 1]);
          } else {
            widget.onFooterRefresh();
          }
        }
      }
    });
  }

  Future _request(headerData) async {
    var getData;

    if (headerData != '' && headerData != null) {
      // 用于头部刷新 -- 具体更新需求看业务
      getData = await widget.futureFunc(context, params: null);
      if (headerData == 'header') {
        setState(() {
          hotList = getData.data;
        });
      } else {
        // 另一种操作 -- 根据业务改写
      }
      return hotList;
    }
    if (widget.params == null)
      getData = await widget.futureFunc(context);
    else {
      getData = await widget.futureFunc(context, params: widget.params);
      oldParams = widget.params.values.join();
    }
    if (getData.data != null) {
      isReflash = true;
      hotList.addAll(getData.data);
    } else {
      isReflash = false;
      setState(() {
        isLatese = true;
      });
    }

    return hotList;
  }

  @override
  void didUpdateWidget(LoadMoreFutureBuilder oldWidget) {
    // 如果方法不一样了，那么则重新请求
    if (oldWidget.futureFunc != widget.futureFunc) {
      print('func not');
      _request('');
    }

    // 如果方法还一样，但是参数不一样了，则重新请求
    if ((oldWidget.futureFunc == widget.futureFunc) &&
        oldWidget.params != null &&
        widget.params != null) {
      if (oldParams != widget.params.values.join()) {
        print('params not');
        oldParams = widget.params.values.join();
        _request('');
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  // 下拉刷新
  Future _onRefresh() async {
    widget.onHeaderRefresh();
    if (widget.needItem != null && widget.needItem) {
      await _request(hotList[0]);
    } else {
      await _request('header');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return new RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: hotList.length + 1,
              itemBuilder: (context, index) {
                if (index == hotList.length) {
                  // 最后一条数据渲染
                  if (!isLatese && isLatese != null) {
                    // 上拉加载
                    return new Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setWidth(24),
                        child: CircularProgressIndicator(
                            strokeWidth: 4.0, backgroundColor: Colors.black),
                      ),
                    );
                  } else {
                    // 最后一条数据
                    return new Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new Text(
                        '没有数据了!!!',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }
                }
                return widget.buildItem(hotList[index]);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return NetErrorWidget(
            callback: () {
              setState(() {
                _future = _request('');
              });
            },
          );
        } else {
          return widget.loadingWidget;
        }
      },
    );
  }
}
