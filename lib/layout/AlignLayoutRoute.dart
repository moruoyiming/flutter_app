import 'package:flutter/material.dart';

class AlignLayoutRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位（Align）"),
      ),
      body: Column(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topRight,
              widthFactor: 2,
              heightFactor: 2,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}