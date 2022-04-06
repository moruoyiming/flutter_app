import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("商品列表"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }))
        ],
      ),
    );
  }
}
