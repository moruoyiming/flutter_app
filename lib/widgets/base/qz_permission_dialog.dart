import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/resource_index.dart';

import '../dialog_button_horizontal.dart';

final double viewWidth = 303;
final double leftMargin = 20;
final double rightMargin = 20;

enum PermissionDialogType { storage, phoneImei, camera, other }

///权限提醒弹框
class QZPermissionDialog {
  static List<String> _titleList = [
    '存储权限',
    '电话权限',
    '相机权限',
  ];

  static List<String> _imageList = [
    'icon_permission_1',
    'icon_permission_3',
    'icon_permission_4',
  ];

  static List<String> _contentList = [
    '将用于保存图片、上传头像、文档下载、视频缓存',
    '获取您的手机识别码，向您提供更优质的个性内容',
    '将用于上传头像、上传图片、扫码等功能',
  ];

  /// 外部调用方法
  static void showCustomDialog(
    PermissionDialogType type,
    BuildContext context,
    Function leftCallBack,
    Function rightCallBack,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return APPDialog(
          title: '欢迎使用学而思大学生',
          content: "为了确保正常使用App，我们在需要的场景将向您申请如下权限：",
          rightText: '不允许',
          leftText: "允许",
          outsideDismiss: false,
          leftTextColor: ColorResource.COLOR_FFFFFF,
          rightTextColor: ColorResource.COLOR_FFFFFF,
          customContentWidget: getContent(type),
          rightCallback: rightCallBack,
          leftCallback: leftCallBack,
          marginlr: 0,
          imageHintText: '',
          confirmColor: ColorResource.COLOR_FFFFFF,
          titleMarge: EdgeInsetsGeometry.infinity,
          contentMarge: EdgeInsetsGeometry.infinity,
          image: '',
          height: 22,
          cancelColor: ColorResource.COLOR_FFFFFF,
          dismissCallback: rightCallBack,
          contentTextStyle: new TextStyle(),
        );
      },
    );
  }

  static Widget getContent(PermissionDialogType type) {
    String iconString = '';
    String title = '';
    String content = '';

    switch (type) {
      case PermissionDialogType.storage:
        iconString = ImageName.common.png(_imageList[0]);
        title = _titleList[0];
        content = _contentList[0];
        break;
      case PermissionDialogType.phoneImei:
        iconString = ImageName.common.png(_imageList[1]);
        title = _titleList[1];
        content = _contentList[1];
        break;
      case PermissionDialogType.camera:
        iconString = ImageName.common.png(_imageList[2]);
        title = _titleList[2];
        content = _contentList[2];
        break;
      default:
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
          child: Text(
            title,
            style: TextStyle(
              color: ColorResource.COLOR_CC000000,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
          child: Text(
            content,
            style: TextStyle(
              color: ColorResource.COLOR_CC000000,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
