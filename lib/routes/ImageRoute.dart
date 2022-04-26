import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:developer' as developer;

class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("images/IMG_7858.JPG"),
              width: 100.0,
              // height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
            ),
            Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F29%2F20200329042030_uCcGM.thumb.400_0.gif&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650598552&t=deb9304e8d48cd4ecd270a50e7da4cce",
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  /**
   * 打印log日志
   */
  void println() {
    stderr.write("stderr print me");
    stdout.write("stdout print me");
    developer.log('log me', name: 'my.app.category');
    developer.log('log me 1', name: 'my.other.category');
    developer.log('log me 2', name: 'my.other.category');
  }

  void someFunction(double offset) {
    developer.debugger(when: offset > 30.0);
  }
}
