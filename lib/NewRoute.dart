import 'package:flutter/material.dart';

//创建一个新的路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: Text("This is new Route"),
        ),
      ),
    );
  }
}