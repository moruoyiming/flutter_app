/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 2020-02-03
 * Time: 14:20
 * email: wanghuaqiang@tal.com
 * tartget: 处理通道相关
 */

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_app/base/constant/constant_config.dart';
import 'package:flutter_app/base/navigator/dnavigator_manager.dart';
import 'package:flutter_app/base/observer/d_node_observer.dart';
import 'package:flutter_app/base/observer/life_cycle_observer.dart';

import '../d_stack.dart';

class DChannel {
  late MethodChannel _methodChannel;

  DChannel(MethodChannel methodChannel) {
    _methodChannel = methodChannel;
    _methodChannel.setMethodCallHandler((MethodCall call) {
      // sendActionToFlutter 处理Native发过来的指令
      if (DStackConstant.nodeToFlutter == call.method) {
        return DNavigatorManager.handleActionToFlutter(call.arguments)!;
      } else if (DStackConstant.lifeCycle == call.method) {
        return LifeCycleHandler.handleLifecycleMessage(call.arguments);
      } else if (DStackConstant.sendOperationNodeToFlutter == call.method) {
        return DNodeObserverHandler.handlerNodeMessage(call.arguments);
      }
      return Future.value();
    });
  }

  Future invokeMethod<T>(String method, [dynamic arguments]) async {
    return _methodChannel.invokeMethod(method, arguments);
  }

  Future sendNodeToNative(Map arguments) async {
    assert(arguments != null);
    return _methodChannel.invokeMethod(DStackConstant.nodeToNative, arguments);
  }

  Future sendRemoveFlutterPageNode(Map arguments) async {
    assert(arguments != null);
    return _methodChannel.invokeMethod(DStackConstant.checkRemoved, arguments);
  }

  Future<List<DStackNode>> getNodeList() async {
    return _methodChannel
        .invokeMethod(DStackConstant.nodeList, null)
        .then((list) {
      if (list is List) {
        List<DStackNode> nodeList = [];
        list.forEach((element) {
          DStackNode node = DStackNode(
              route: element["route"], pageType: element["pageType"]);
          nodeList.add(node);
        });
        return Future.value(nodeList);
      }
      return Future.value([]);
    });
  }

  Future sendHomePageRoute(String? route) {
    return _methodChannel.invokeMethod(
        DStackConstant.sendHomePageRoute, {"homePageRoute": route});
  }

  /// 发送更新临界节点的信息
  Future sendUpdateBoundaryNode(Map params) {
    return _methodChannel.invokeMethod(
        DStackConstant.sendUpdateBoundaryNode, params);
  }
}
