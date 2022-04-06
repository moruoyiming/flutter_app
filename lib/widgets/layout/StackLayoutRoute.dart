import 'package:flutter/material.dart';

class StackLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Stack、Positioneds"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          //指定未定位或部分定位widget的对齐方式
          textDirection: TextDirection.ltr,
          fit: StackFit.loose,
          //此参数用于确定没有定位的子组件如何去适应Stack的大小
          //StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
          overflow: Overflow.clip,
          //此属性决定如何显示超出Stack显示空间的子组件；值为Overflow.clip时，
          //超出部分会被剪裁（隐藏），值为Overflow.visible 时则不会
          children: <Widget>[
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            ),
            Positioned(
              top: 30.0,
              left: 18,
              child: Text("sdfasdfasd"),
            )
          ],
        ),
      ),
    );
  }
}
