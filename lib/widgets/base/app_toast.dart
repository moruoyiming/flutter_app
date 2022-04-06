import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_app/resources/image_resource.dart';

import '../app_loading_indicator.dart';

const Color _bgColor = Colors.black87;
const double _radius = 12.0;
const int _closeTime = 1500;

class Toast {
  static show(String msg, {duration = 2000}) {
    if (msg == null || msg.isEmpty) {
      return;
    }
    showToast(msg,
        textPadding: EdgeInsets.fromLTRB(16, 18, 16, 18),
        duration: Duration(milliseconds: duration));
  }

  static showLoadingWidgetToast({int time = 20000}) {
    var w = Center(
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(12)),
        child: AppActivityIndicator(radius: 14, indicatorColor: Colors.white),
      ),
    );
    showToastWidget(w, duration: Duration(milliseconds: time));
  }

  static showLoadingWidgetToastClick({int time = 20000}) {
    var w = Center(
      child: Container(
        // width: Utils.screenWidth,
        // height: Utils.screenHeight,
        child: Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(12)),
          child: AppActivityIndicator(radius: 14, indicatorColor: Colors.white),
        ),
      ),
    );
    showToastWidget(w, duration: Duration(milliseconds: time));
  }

  static showSuccess(loadingText) {
    var w = Container(
      height: 136,
      margin: const EdgeInsets.all(50.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: _bgColor, borderRadius: BorderRadius.circular(_radius)),
      child: ClipRect(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(16, 30, 16, 12),
            child: Icon(
              Icons.check_circle_outline,
              size: 42,
              color: Colors.white,
            ),
          ),
          Container(
            constraints: BoxConstraints(minWidth: 136, maxWidth: 300), //最大宽度
            child: Text(loadingText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, color: Color(0xE6FFFFFF)),
                textAlign: TextAlign.center),
          ),
        ],
      )),
    );
    showToastWidget(w, duration: Duration(milliseconds: _closeTime));
  }

  static showWarning(loadingText) {
    var w = Container(
      margin: const EdgeInsets.all(50.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: _bgColor, borderRadius: BorderRadius.circular(_radius)),
      child: ClipRect(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(4.0),
              child: Image.asset(ImageName.common.png('icon_warning'))),
          Text(loadingText,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center),
        ],
      )),
    );
    showToastWidget(w, duration: Duration(milliseconds: _closeTime));
  }

  static showError(loadingText) {
    var w = Container(
      margin: const EdgeInsets.all(50.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: _bgColor, borderRadius: BorderRadius.circular(_radius)),
      child: ClipRect(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            margin: EdgeInsets.only(bottom: 8.0),
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.highlight_off,
              size: 30,
              color: Colors.white,
            ),
          ),
          Text(loadingText,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center),
        ],
      )),
    );
    showToastWidget(w, duration: Duration(milliseconds: _closeTime));
  }

  static cancelToast() {
    dismissAllToast();
  }
}
