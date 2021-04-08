import 'package:flutter/material.dart';

//定义一个controller
TextEditingController _unameController = TextEditingController();

class TextFieldRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              autofocus: true,
              controller: _unameController,
              onChanged: (v) {
                print("onChange: $v");
              },
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              onChanged: (v) {
                print("onChange: $v");
              },
            ),
          ],
        ),
      ),
    );
  }
}
