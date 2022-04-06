import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widget
          ),
          children:<Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ]
      )
      ,
    );
  }
}
// Column(
// children: [
// ,
// GridView(
// padding: EdgeInsets.zero,
// gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 120.0,
// childAspectRatio: 2.0 //宽高比为2
// ),
// children: <Widget>[
// Icon(Icons.ac_unit),
// Icon(Icons.airport_shuttle),
// Icon(Icons.all_inclusive),
// Icon(Icons.beach_access),
// Icon(Icons.cake),
// Icon(Icons.free_breakfast),
// ],
// ),
// GridView.extent(
// maxCrossAxisExtent: 120.0,
// childAspectRatio: 2.0,
// children: <Widget>[
// Icon(Icons.ac_unit),
// Icon(Icons.airport_shuttle),
// Icon(Icons.all_inclusive),
// Icon(Icons.beach_access),
// Icon(Icons.cake),
// Icon(Icons.free_breakfast),
// ],
// )
// ],
// )