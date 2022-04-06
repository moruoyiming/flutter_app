/*
 * Created with Android Studio.
 * User: wangshuai
 * Date: 2019-07-07
 * Time: 18:02
 * tartget: components-dialog封装
 */

/*
* 用法示例
showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return APPDialog(
                title: '标题',
                content: '距离知识体系诊断结果只差一步了',
                isCancel: true,
                confirmContent: '继续填写',
                confirmTextColor: Colors.red,
                dismissContent: '确认放弃',
                confirmCallback: () {
                  print('点击了确定按钮');
                },
                dismissCallback: () {
                  print('点击了取消按钮');
                },
              );
            },
          );log
* */
import 'package:flutter/material.dart';

import 'base/app_base_button.dart';

class APPDialog extends StatefulWidget {
  //无图片dialog
  final String title; //title
  final EdgeInsetsGeometry titleMarge; // title的marge-以便业务修改
  final String content; //content
  final EdgeInsetsGeometry contentMarge; // content的marge-以便业务修改
  final TextStyle contentTextStyle; // content的textStyle-以便业务修改
  final String rightText; //右侧按钮文本,默认文本是"确认"
  final Color rightTextColor; //右侧按钮文本颜色
  final Color leftTextColor; //取消按钮文本颜色
  final String leftText; //取消按钮文本
  final bool isCancel; //是否有取消按钮，默认为true true：有 false：没有
  final Color confirmColor; //确定按钮颜色
  final Color cancelColor; //取消按钮颜色
  final bool outsideDismiss; //点击弹窗外部，关闭弹窗，默认为true true：可以关闭 false：不可以关闭
  final double height; //弹窗内容高度
  final Function rightCallback; //点击确定按钮回调
  final Function dismissCallback; //弹窗关闭回调
  final Function leftCallback; //左侧第一个按钮回调
  final double marginlr; // 对话框左右边界

  //有图片的dialog
  final String image;
  final String imageHintText; //图片下方的文本提示

  final Widget customContentWidget; // 自定义的widget，供业务侧传入自定义的widget内容

  const APPDialog({
    Key key,
    this.title,
    this.titleMarge,
    this.content,
    this.rightText,
    this.leftText,
    this.rightTextColor,
    this.leftTextColor,
    this.isCancel = true,
    this.confirmColor,
    this.cancelColor,
    this.outsideDismiss = true,
    this.height,
    this.rightCallback,
    this.leftCallback,
    this.dismissCallback,
    this.image,
    this.marginlr,
    this.imageHintText,
    this.customContentWidget,
    this.contentMarge,
    this.contentTextStyle,
  }) : super(key: key);

  @override
  _APPDialogState createState() => _APPDialogState();
}

class _APPDialogState extends State<APPDialog> {
  final defaultColor = Colors.white;
  final lineColor = Colors.red;
  final defaultTextColor = Colors.black;

  void confirmDialog() {
    dismissDialog();
    if (widget.rightCallback != null) {
      widget.rightCallback();
    }
  }

  void dismissDialog() {
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.pop(context);
  }

  void leftBtnDialog() {
    if (widget.leftCallback != null) {
      widget.leftCallback();
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column columnText = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          // title
          margin: widget.titleMarge ??
              EdgeInsets.only(top: 30, bottom: 0, left: 20, right: 20),
          child: widget.title == null
              ? Container()
              : Center(
                  child: Text(
                    widget.title == null ? '' : widget.title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333)),
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              margin: widget.contentMarge ?? EdgeInsets.all(0),
              child: Text(
                widget.content == null ? '' : widget.content,
                style: widget.contentTextStyle ??
                    TextStyle(
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
        widget.customContentWidget != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
                child: widget.customContentWidget,
              )
            : Center(),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 24, left: 20, right: 20),
          child: Container(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: widget.isCancel
                          ? Container(
                              decoration: BoxDecoration(
                                color: widget.cancelColor == null
                                    ? defaultColor
                                    : widget.cancelColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0)),
                              ),
                              child: getPrimaryButtonWithBorder(
                                widget.leftText,
                                44.0,
                                16.0,
                                FontWeight.bold,
                                leftBtnDialog,
                              ),
                            )
                          : Text(''),
                      flex: widget.isCancel ? 1 : 0),
                  SizedBox(
                      width: widget.isCancel ? 15.0 : 0,
                      height: widget.isCancel ? 48.0 : 0,
                      child: Container()),
                  Expanded(
                      child: getPrimaryButtonWithBackground(
                        widget.rightText,
                        44.0,
                        16.0,
                        FontWeight.bold,
                        confirmDialog,
                      ),
                      flex: 1),
                ],
              )),
        ),
      ],
    );

    Column columnImage = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: widget.imageHintText == null ? 35.0 : 23.0,
        ),
        Image(
            image: AssetImage(widget.image == null ? '' : widget.image),
            width: 72.0,
            height: 72.0),
        SizedBox(height: 10.0),
        Text(widget.imageHintText == null ? "" : widget.imageHintText,
            style: TextStyle(fontSize: 16.0)),
      ],
    );
    double dialogWidth;
    if (widget.marginlr != null) {
      dialogWidth = width - widget.marginlr;
    } else if (widget.image == null) {
      dialogWidth = 303;
    } else {
      dialogWidth = width - 150;
    }

    return WillPopScope(
        child: GestureDetector(
          onTap: () {
            if (widget.outsideDismiss) {
              dismissDialog();
            }
          },
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                width: dialogWidth,
                child: widget.image == null ? columnText : columnImage,
                decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.outsideDismiss;
        });
  }
}
