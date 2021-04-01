import 'package:flutter/material.dart';

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
                width: 100.0
            ),
          ],
        ),
      ),
    );
  }

}