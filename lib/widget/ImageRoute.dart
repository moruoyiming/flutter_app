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
          ],
        ),
      ),
    );
  }
}
