import 'package:flutter/material.dart';

class LightonGestureRoute extends StatefulWidget {
  @override
  State<LightonGestureRoute> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LightonGestureRoute> {
  bool _lightIsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.lightbulb_outline,
                color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
                size: 60,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _lightIsOn = !_lightIsOn;
                });
              },
              child: Container(
                color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                child: Text(_lightIsOn ? 'TURE LIGHT OFF' : 'TURN LIGHT ON'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
