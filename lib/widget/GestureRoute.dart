import 'package:flutter/material.dart';

class GestureRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      onDoubleTap: () {
        print('MyButton was onDoubleTap!');
      },
      onLongPress: () {
        print('MyButton was onLongPress!');
      },

      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}
