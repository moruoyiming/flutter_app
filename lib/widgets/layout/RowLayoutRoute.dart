import 'package:flutter/material.dart';

/**
 * 线性布局（Row和Column）
 */
class RowLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局（Row和Column）"),
      ),
      body: Column(
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("父类布局为Column"),
          Text("textDirection:表示水平方向子组件的布局顺序(是从左往右还是从右往左)"),
          Text("mainAxisSize:表示Row在主轴(水平)方向占用的空间"),
          Text("mainAxisAlignment：表示子组件在Row所占用的水平空间内对齐方式"),
          Text("crossAxisAlignment：表示子组件在纵轴方向的对齐方式"),
          Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(
                    " hello world ",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(" I am Jack "),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: [
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
