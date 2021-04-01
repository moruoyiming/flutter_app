import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("EchoRoute"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: Text("This is new EchoRoute args="+args+wordPair.toString()),
        ),
      ),
    );
  }

}