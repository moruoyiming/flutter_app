import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/CounterWidget.dart';
import 'package:flutter_app/widgets/ParentWidget.dart';
import 'package:flutter_app/widgets/TapboxA.dart';
import 'package:flutter_app/widgets/BrigitteText.dart';

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              ),
              BrigitteText(text: "Hello World"),
              TapboxA(),
              ParentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}