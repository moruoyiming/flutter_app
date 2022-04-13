import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/resource_index.dart';

//顶部返回按钮
Widget getIconButtonImageBack(VoidCallback _callback) {
  return IconButton(
    icon: Image.asset(ImageName.common.png('base_icon_back')),
    onPressed: _callback,
  );
}

//主题色按钮 圆角 -26
Widget getPrimaryButtonMatchWidth(
  String text,
  bool isEnable,
  VoidCallback _callback,
) {
  return Container(
      child: SizedBox(
    // width: Utils.screenWidth, //设置宽高最大
    child: FlatButton(
      color: isEnable
          ? ColorResource.primaryColor
          : ColorResource.primaryColor_disable,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text,
            style: TextStyle(
              fontSize: 18.0,
              color: ColorResource.COLOR_FFFFFF,
            )),
      ),
      onPressed: _callback,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(26))),
    ),
  ));
}

//自定义颜色按钮 圆角 -26
Widget getPrimaryButton(
    String text, Color color, double radius, VoidCallback _callback) {
  return FlatButton(
    color: color,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text,
          style: TextStyle(
            fontSize: 18.0,
            color: ColorResource.COLOR_FFFFFF,
          )),
    ),
    onPressed: () {
      _callback();
    },
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius))),
  );
}

/// 主题色按钮 用于登录页面的切换
Widget getLoginSwitchWidget(String text, double width, double height,
    double fontSize, VoidCallback _callback) {
  return InkWell(
    child: new Container(
      width: width,
      height: height,
      color: ColorResource.loignBgColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorResource.primaryColor, fontSize: fontSize),
      ),
    ),
    onTap: _callback,
  );
}

/// 按钮 主题色边框
Widget getPrimaryButtonWithBorder(
  String text,
  double height,
  double fontSize,
  FontWeight fontWeight,
  VoidCallback _callback,
) {
  return OutlineButton(
    color: ColorResource.COLOR_FFFFFF,
    highlightColor: ColorResource.COLOR_FFFFFF,
    splashColor: ColorResource.COLOR_FFFFFF,
    highlightedBorderColor: ColorResource.primaryColor,
    borderSide: BorderSide(
      width: 1,
      color: ColorResource.primaryColor,
    ),
    child: Container(
      height: height,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: ColorResource.primaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height / 2),
    ),
    onPressed: _callback,
  );
}

/// 按钮 主题色背景
Widget getPrimaryButtonWithBackground(
  String text,
  double height,
  double fontSize,
  FontWeight fontWeight,
  VoidCallback _callback,
) {
  return FlatButton(
    color: ColorResource.primaryColor,
    highlightColor: ColorResource.primaryColor_disable,
    splashColor: ColorResource.primaryColor,
    child: Container(
      height: height,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: ColorResource.COLOR_FFFFFF,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height / 2),
    ),
    onPressed: _callback,
  );
}

//自定义颜色按钮 圆角
Widget getAutoButton(String text, bool isEnable, double width, double height,
    VoidCallback _callback) {
  return Container(
    width: width,
    height: height,
    child: FlatButton(
      color:
          isEnable ? ColorResource.primaryColor : ColorResource.COLOR_FFEAEAEA,
      child: Center(
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.0,
              color: isEnable
                  ? ColorResource.COLOR_FFFFFF
                  : ColorResource.COLOR_66000000,
            )),
      ),
      onPressed: () {
        _callback();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(height / 2))),
    ),
  );
}

/// 按钮 主题色边框
Widget getAutoButtonWithBorder(String text, double width, double height,
    double fontSize, FontWeight fontWeight, VoidCallback _callback, bool isEnable) {
  return isEnable
      ? Container(
          height: height,
          width: width,
          padding: EdgeInsets.fromLTRB(1, 1, 1, 1), //为边框流出距离
          child: OutlineButton(
            color: ColorResource.COLOR_FFFFFF,
            highlightColor: ColorResource.COLOR_FFFFFF,
            splashColor: ColorResource.COLOR_FFFFFF,
            highlightedBorderColor: ColorResource.primaryColor,
            borderSide: BorderSide(
              width: 1,
              color: isEnable
                  ? ColorResource.primaryColor
                  : ColorResource.COLOR_FFF9F9F9,
            ),
            child: Container(
//              decoration: BoxDecoration(
//                color: Color(0x1F15CFDC),
//                borderRadius:
//                BorderRadius.all(Radius.circular(height/2)),
//              ),
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isEnable
                      ? ColorResource.primaryColor
                      : ColorResource.COLOR_66000000,
                  fontSize: fontSize,
                  fontWeight: isEnable ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height / 2),
            ),
            onPressed: _callback,
          ),
        )
      : FlatButton(
          color: ColorResource.COLOR_FFF9F9F9,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            color: ColorResource.COLOR_FFF9F9F9,
            child: Text(text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  color: ColorResource.COLOR_66000000,
                )),
          ),
          onPressed: () {
            _callback();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(height / 2))),
        );
}
