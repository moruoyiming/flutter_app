import 'package:flutter_app/resources/color_resource.dart';
import 'package:flutter_app/resources/image_resource.dart';
import 'package:flutter_app/utils/text_utils.dart';
import 'package:flutter/material.dart';

typedef LeftItemCallBack = void Function();

///通用标题栏
class CommonAppBar {
  static const _DEFAULT_TITLE_BG_COLOR = ColorResource.COLOR_FFFFFF;
  static const _DEFAULT_TITLE_TEXT_SIZE = 20.0;
  static const _DEFAULT_TITLE_TEXT_COLOR = ColorResource.COLOR_000000_80;

  // 标题
  final String title;

  // 标题文字颜色
  final Color titleColor;

  final double titleTextSize;

  // 返回按钮的事件回调
  final LeftItemCallBack leftCallBack;

  // 背景颜色
  final Color backgroundColor;

  // 返回图标
  final String backIconRes;

  // 自定义配置右侧widget
  final List<Widget> actionList;

  CommonAppBar(this.title,
      {this.titleColor = _DEFAULT_TITLE_TEXT_COLOR,
      this.titleTextSize = _DEFAULT_TITLE_TEXT_SIZE,
      this.leftCallBack,
      this.backgroundColor = _DEFAULT_TITLE_BG_COLOR,
      this.backIconRes,
      this.actionList});

  AppBar defaultBar(
      {Key key, BuildContext context, String backPath, double elevation}) {
    return AppBar(
      key: key,
      title: Text(
        this.title,
        style: TextStyle(
          color: this.titleColor,
          fontSize: titleTextSize,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {
          if (leftCallBack != null) {
            leftCallBack();
          }
          // else {
          //   DRouter.pop();
          // }
        },
        child: Image.asset(
          TextUtils.checkString(
            backIconRes,
            ImageName.common.png('base_icon_back'),
          ),
        ),
      ),
      actions: actionList,
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
      elevation: elevation == null ? 0.5 : elevation,
    );
  }

  AppBar homeBar(
      {Key key, BuildContext context, String backPath, double elevation}) {
    return AppBar(
      key: key,
      title: Text(
        this.title,
        style: TextStyle(
          color: this.titleColor,
          fontSize: titleTextSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: actionList,
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
      elevation: elevation == null ? 0 : elevation,
    );
  }
}

//假导航栏
Widget getLoginAppBar(bool isClose) {
  final String _imgName = isClose ? 'base_icon_close' : 'base_icon_back';

  return Container(
    height: 44,
    child: Row(
      children: <Widget>[
        Container(
          width: 12,
        ),
        Container(
          width: 44,
          height: 44,
          child: IconButton(
            splashColor: Colors.transparent, //消除点击阴影效果
            highlightColor: Colors.transparent, //消除点击阴影效果
            icon: Image.asset(
              ImageName.common.png(_imgName),
              width: 28,
              height: 28,
            ),
            onPressed: () {
              // DRouter.pop(); //关闭页面
            },
          ),
        ),
      ],
    ),
  );
}
