import 'package:flutter/material.dart';

class CustomShapeWidget extends StatefulWidget {
  CustomShapeWidget() : super();

  @override
  _CustomShapeWidgetState createState() {
    return new _CustomShapeWidgetState();
  }
}

class _CustomShapeWidgetState extends State<CustomShapeWidget> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Material(
            color: _active ? Colors.orangeAccent : Colors.green,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 2.0, color: _active ? Colors.red : Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 2,
            child: new Container(
              padding: EdgeInsetsDirectional.only(start: 20, end: 20),
              height: 50.0,
              alignment: Alignment.center,
              child: Row(
                children: [
                  new Text(
                    _active ? 'Active' : 'Active',
                    style: new TextStyle(
                        fontSize: 32.0,
                        color: _active ? Colors.white : Colors.red),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
