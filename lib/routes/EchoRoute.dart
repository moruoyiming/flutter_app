import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //获取路由参数
    var args = ModalRoute.of(context)!.settings.arguments;
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("EchoRoute"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Navigator.pop(context, 1);
            Future<String> sss = loadAsset();
            print(sss.toString());
          },
          child:
              Text("This is new EchoRoute args=" + args.toString() + wordPair.toString()),
        ),
      ),
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
