import 'package:flutter/material.dart';

class TextRoute extends StatelessWidget {
  var canpop;

  @override
  Widget build(BuildContext context) {
    canpop = ModalRoute.of(context)?.canPop;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.red,
          onPressed: _onPressed,
        ),
        title: Text("TextRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello world",
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello world ! I'm Jack." * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.6,
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                // recognizer: _tapRecognizer
              ),
            ])),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                // fontFamily: 'Raleway'
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    print("object" + canpop);
  }
}
