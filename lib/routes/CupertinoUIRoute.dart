//导入cupertino widget库
import 'package:flutter/cupertino.dart';

class CupertinoUIRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: (){
            print("Cupertino on click");
          },
        ),
      ),
    );
  }

}