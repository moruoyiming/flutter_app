/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 2020-02-03
 * Time: 14:20
 * email: wanghuaqiang@tal.com
 * tartget: flutter侧用户调用入口
 */

import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/constant/constant_config.dart';
import 'package:flutter_app/base/widget/page_route.dart';

import '../d_stack.dart';
import 'dnavigator_gesture_observer.dart';
import 'node_entity.dart';

/// 主要两个部分：
/// 1.发送节点信息到Native，Native记录完整的路由信息
/// 2.处理Native发过来的指令，Native侧节点管理处理完节点信息，如果有指令过来，则flutter根据节点信息做相应的跳转事件

class DNavigatorManager {
  /// 1.发送节点信息到Native
  /// routeName 路由名，pageType native或者flutter, params 参数

  /// 获取navigator
  static NavigatorState? get _navigator =>
      DStack.instance.navigatorKey.currentState;

  /// homePage被replace了
  static bool _hasReplaceHomePage = false;

  static Future push(String routeName, PageType pageType,
      {Map? params, bool? maintainState, bool animated = true}) {
    if (pageType == PageType.flutter) {
      var route = DNavigatorManager.materialRoute(
          routeName: routeName,
          params: params,
          maintainState: maintainState!,
          pushAnimated: animated);
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: {}, animated: animated, route: route);
      return _navigator!.push(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: params, animated: animated);
      return Future.value(true);
    }
  }

  static Future animatedFlutterPage(String routeName, { 
    Map? params,
    TransitionType? transition,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder? transitionsBuilder,
    bool replace = false,
    bool clearStack = false
  }) {
    var route = routeCreator(routeName,
        params: params, 
        transition: transition, 
        transitionDuration: 
        transitionDuration, 
        transitionsBuilder: transitionsBuilder);
    
    if (clearStack) {
      DNavigatorManager.nodeHandle(
          routeName, PageType.flutter, DStackConstant.pushAndRemoveUntil,
          result: params, animated: true, route: route);
      return _navigator!.pushAndRemoveUntil(route, (route) => route == null);
    } else if (replace) {
      DNavigatorManager.nodeHandle(
          routeName, PageType.flutter, DStackConstant.replace,
          result: {}, route: route);
      return _navigator!.pushReplacement(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, PageType.flutter, DStackConstant.push,
          result: {}, route: route);
      return _navigator!.push(route);
    }
  }
  
  /// 弹出页面
  static Future present(String routeName, PageType pageType,
      {Map? params, bool? maintainState, bool animated = true}) {
    if (pageType == PageType.flutter) {
      var route = DNavigatorManager.materialRoute(
          routeName: routeName,
          params: params,
          maintainState: maintainState!,
          pushAnimated: animated,
          fullscreenDialog: true);
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.present,
          result: {}, animated: animated, route: route);
      return _navigator!.push(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.present,
          result: params, animated: animated);
      return Future.value(true);
    }
  }

  /// 自定义进场动画
  /// animationBuilder 进场动画的builder
  /// pushDuration 进场时间
  /// popDuration 退场时间
  static Future pushWithAnimation(
    String routeName,
    PageType pageType,
    PushAnimationPageBuilder animationBuilder, {
    Map? params,
    bool? replace,
    Duration? pushDuration,
    Duration? popDuration,
    bool popGesture = false,
  }) {
    if (pageType == PageType.flutter) {
      RouteSettings settings =
          RouteSettings(name: routeName, arguments: params);
      DStackWidgetBuilder stackWidgetBuilder =
          DStack.instance.pageBuilder(routeName);
      WidgetBuilder builder = stackWidgetBuilder(params);
      PageRoute route = DStackPageRouteBuilder(
          pageBuilder: builder,
          settings: settings,
          pushTransition: pushDuration,
          popTransition: popDuration,
          animationBuilder: animationBuilder,
          popGesture: popGesture);
      if (replace!) {
        DNavigatorManager.nodeHandle(
            routeName, pageType, DStackConstant.replace,
            result: {}, route: route);
        return _navigator!.pushReplacement(route);
      }
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: {}, route: route);
      return _navigator!.push(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: params);
      return Future.value(true);
    }
  }

  /// 自定义进场方式
  static Future animationPage(
    String routeName,
    PageType pageType,
    AnimatedPageBuilder animatedBuilder, [
    Map? params,
    Duration? transitionDuration = defaultPushDuration,
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool replace = false,
  ]) {
    if (pageType == PageType.flutter) {
      PageRouteBuilder route = DNavigatorManager.animationRoute(
        animatedBuilder: animatedBuilder,
        routeName: routeName,
        params: params,
        transitionDuration: transitionDuration!,
        opaque: opaque,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      );
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: {}, route: route);
      if (replace) {
        return _navigator!.pushReplacement(route);
      } else {
        return _navigator!.push(route);
      }
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: params);
      return Future.value(true);
    }
  }

  /// 提供外界直接传builder的能力
  static Future pushBuild(
      String routeName, PageType pageType, WidgetBuilder builder,
      {Map? params,
      bool? maintainState,
      bool? fullscreenDialog,
      bool animated = true}) {
    if (pageType == PageType.flutter) {
      var route = DNavigatorManager.materialRoute(
          routeName: routeName,
          params: params,
          maintainState: maintainState!,
          pushAnimated: animated,
          fullscreenDialog: fullscreenDialog!,
          builder: builder);
      DNavigatorManager.nodeHandle(
          routeName, PageType.flutter, DStackConstant.push,
          result: {}, animated: animated, route: route);
      return _navigator!.push(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.push,
          result: params, animated: animated);
      return Future.value(true);
    }
  }

  /// 目前只支持flutter使用，替换flutter页面
  static Future replace(String? routeName, PageType? pageType,
      {Map? params,
      bool maintainState = true,
      bool homePage = false,
      bool animated = true,
      bool fullscreenDialog = false}) {
    if (pageType == PageType.flutter) {
      var route = DNavigatorManager.materialRoute(
          routeName: routeName,
          params: params,
          maintainState: maintainState,
          pushAnimated: animated,
          fullscreenDialog: fullscreenDialog);
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.replace,
          result: params, homePage: homePage, animated: animated, route: route);
      return _navigator!.pushReplacement(route);
    } else {
      DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.replace,
          result: params, homePage: homePage, animated: animated);
      return Future.error('not flutter page');
    }
  }

  /// 跳转指定页面并清除剩余所有页面
  static pushAndRemoveUntil(String routeName, PageType pageType,
      {Map? params,
      bool maintainState = true,
      bool homePage = false,
      bool animated = true,
      bool fullscreenDialog = false}) {
    var route = DNavigatorManager.materialRoute(
        routeName: routeName,
        params: params,
        maintainState: maintainState,
        pushAnimated: animated,
        fullscreenDialog: fullscreenDialog);
    DNavigatorManager.nodeHandle(
        routeName, pageType, DStackConstant.pushAndRemoveUntil,
        result: params, homePage: homePage, animated: animated, route: route);
    return _navigator!.pushAndRemoveUntil(route, (route) => route == null);
  }

  /// result 返回值，可为空
  /// pop可以不传路由信息
  static void pop({Map? result, bool animated = true}) {
    DNavigatorManager.nodeHandle(null, null, DStackConstant.pop,
        result: result, animated: animated);
  }

  static void popWithGesture(Route route) {
    DNavigatorManager.nodeHandle(null, null, DStackConstant.gesture,
        route: route);
  }

  static void popTo(String routeName, PageType pageType,
      {Map? result, bool animated = true}) {
    DNavigatorManager.nodeHandle(routeName, pageType, DStackConstant.popTo,
        result: result, animated: animated);
  }

  static void popToRoot({bool animated = true}) {
    DNavigatorManager.nodeHandle(null, null, DStackConstant.popToRoot,
        animated: animated);
  }

  static void popSkip(String skipName, {Map? result, bool animated = true}) {
    DNavigatorManager.nodeHandle(skipName, null, DStackConstant.popSkip,
        result: result, animated: animated);
  }

  static void dismiss({Map? result, bool animated = true}) {
    DNavigatorManager.nodeHandle(null, null, DStackConstant.dismiss,
        result: result, animated: animated);
  }

  static void nodeHandle(String? target, PageType? pageType, String actionType,
      {Map? result, bool? homePage, bool animated = true, Route? route}) {
    Map arguments = {
      'target': target,
      'pageType': '$pageType'.split('.').last,
      'params': (result != null) ? result : {},
      'actionType': actionType,
      'homePage': homePage,
      'animated': animated,
      'identifier': identifierWithRoute(route)
    };
    DStack.instance.channel!.sendNodeToNative(arguments);
  }

  /// 移除flutter的节点
  static void removeFlutterNode(String? target, {String? identifier}) {
    Map arguments = {
      'target': target,
      'pageType': 'flutter',
      'actionType': 'didPop',
      'identifier': identifier
    };
    DStack.instance.channel!.sendRemoveFlutterPageNode(arguments);
  }

  /// 生成route的唯一标识
  static String identifierWithRoute(Route? route) {
    String identifier = "";
    if (route != null) {
      if (route.settings != null) {
        if (route is PopupRoute) {
          identifier = "${route.runtimeType.toString()}_${route.hashCode}";
        } else {
          if (route.settings.name != null) {
            identifier = "${route.settings.name}_${route.hashCode}";
          } else {
            identifier = "${route.toString()}_${route.hashCode}";
          }
        }
      }
    }
    return identifier;
  }

  // 记录节点进出，如果已经是首页，则不再pop
  static Future gardPop([Map? params, bool? animated = true]) {
    if (DStackNavigatorObserver.instance!.routerCount <= 1) {
      return Future.value('已经是首页，不再出栈');
    }
    _navigator!.pop(DStackPopResult<Map>(animated: animated, result: params));
    return Future.value(true);
  }

  /// 2.处理Native发过来的指令
  /// argument里包含必选参数routeName，actionType，可选参数params
  static Future? handleActionToFlutter(Map arguments) {
    /// 处理实际跳转
    DNodeEntity nodeEntity = DNodeEntity.fromJson(arguments);
    debugPrint("【sendActionToFlutter】 \n"
        "【arguments】${nodeEntity.toJson()} \n"
        "【navigator】$_navigator ");
    final String? action = nodeEntity.action;
    switch (action) {
      case DStackConstant.push:
        continue Present;
      Present:
      case DStackConstant.present:
        {
          final DNode node = nodeEntity.nodeList.first;
          final Map? params = node.params;
          final bool? homePage = node.homePage;
          final PageType? pageType = node.pageType;
          final String? router = node.target;

          if (homePage != null &&
              homePage == true &&
              node.boundary != null &&
              node.boundary == true) {
            _hasReplaceHomePage = true;
            return replace(router, pageType,
                homePage: homePage, animated: false, params: node.params);
          } else {
            PageRoute route;
            bool? boundary = node.boundary;
            if (boundary != null && boundary) {
              /// 临界页面不开启动画
              route = DNavigatorManager.materialRoute(
                routeName: router,
                params: params,
                fullscreenDialog: action == DStackConstant.present,
                pushAnimated: false,
              );
            } else {
              route = DNavigatorManager.materialRoute(
                  routeName: router,
                  params: params,
                  fullscreenDialog: action == DStackConstant.present);
            }
            node.identifier = identifierWithRoute(route);
            Map json = node.toJson();
            DStack.instance.channel!.sendUpdateBoundaryNode(json);
            return _navigator!.push(route);
          }
        }
        break;
      case DStackConstant.pop:
        {
          final DNode node = nodeEntity.nodeList.first;
          return DNavigatorManager.gardPop(node.params, nodeEntity.animated);
        }
        break;
      case DStackConstant.popTo:
        continue PopSkip;
      case DStackConstant.popToRoot:
        continue PopSkip;
      PopSkip:
      case DStackConstant.popSkip:
        {
          Future? pop;
          int length = nodeEntity.nodeList.length - 1;
          for (int i = length; i >= 0; i--) {
            final DNode node = nodeEntity.nodeList[i];
            bool? _animated = i == length;
            if (nodeEntity.animated == false) {
              _animated = nodeEntity.animated;
            }
            pop = DNavigatorManager.gardPop(node.params, _animated);
          }
          return pop;
        }
        break;
      case DStackConstant.dismiss:
        {
          final DNode node = nodeEntity.nodeList.first;
          return DNavigatorManager.gardPop(node.params, nodeEntity.animated);
        }
        break;
      case DStackConstant.gesture:
        {
          // native发消息过来时，需要处理返回至上一页
          final DNode node = nodeEntity.nodeList.first;
          DStackNavigatorObserver.instance!
              .setGesturingRouteName(DStackConstant.nativeDidPopGesture);
          return DNavigatorManager.gardPop(node.params);
        }
        break;
      case DStackConstant.replace:
        {
          if (_hasReplaceHomePage) {
            _hasReplaceHomePage = false;
            final DNode node = nodeEntity.nodeList.first;
            var route = DNavigatorManager.materialRoute(
                routeName: node.target,
                params: node.params,
                pushAnimated: false);
            return _navigator!.pushReplacement(route);
          }
          return Future.value(true);
        }
        break;
    }
    return null;
  }

  /// 用户自定义flutter页面转场动画
  static PageRouteBuilder animationRoute({
    required AnimatedPageBuilder animatedBuilder,
    required String routeName,
    Map? params,
    Duration transitionDuration = const Duration(milliseconds: 200),
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    RouteSettings settings = RouteSettings(name: routeName, arguments: params);
    PageRouteBuilder pageRoute = PageRouteBuilder<dynamic>(
      settings: settings,
      transitionDuration: transitionDuration,
      opaque: opaque,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        DStackWidgetBuilder stackWidgetBuilder =
            DStack.instance.pageBuilder(routeName);

        return animatedBuilder(
            context, animation, secondaryAnimation, stackWidgetBuilder(params));
      },
    );
    return pageRoute;
  }

  /// 创建PageRoute
  /// pushAnimated 是否有进场动画
  /// popAnimated 是否有退场动画
  static PageRoute materialRoute(
      {String? routeName,
      Map? params,
      bool pushAnimated = true,
      bool popAnimated = true,
      bool maintainState = true,
      bool fullscreenDialog = false,
      WidgetBuilder? builder}) {
    RouteSettings userSettings =
        RouteSettings(name: routeName, arguments: params);

    if (builder == null) {
      DStackWidgetBuilder stackWidgetBuilder =
          DStack.instance.pageBuilder(routeName);
      builder = stackWidgetBuilder(params);
    }

    DStackPageRouteBuilder route = DStackPageRouteBuilder(
      pageBuilder: builder,
      settings: userSettings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      pushTransition: pushAnimated ? defaultPushDuration : Duration.zero,
      popTransition: popAnimated ? defaultPopDuration : Duration.zero,
    );
    return route;
  }

  static Route routeCreator(String routeName, {
    Map? params,
    TransitionType? transition,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder? transitionsBuilder
  }) {
    RouteSettings routeSettings = RouteSettings(name: routeName, arguments: params);

    bool isNativeTransition = (transition == TransitionType.native || transition == TransitionType.nativeModal);
    DStackWidgetBuilder stackWidgetBuilder = DStack.instance.pageBuilder(routeName);
    WidgetBuilder builder = stackWidgetBuilder(params);
    if (isNativeTransition) {
      if (Platform.isIOS) {
        return CupertinoPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == TransitionType.nativeModal,
            builder: builder);
      } else {
        return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == TransitionType.nativeModal,
            builder: builder);
      }
    } else if (transition == TransitionType.material || transition == TransitionType.materialFullScreenDialog) {
      return MaterialPageRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog: transition == TransitionType.materialFullScreenDialog,
          builder: builder);
    } else if (transition == TransitionType.cupertino || transition == TransitionType.cupertinoFullScreenDialog) {
      return CupertinoPageRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog: transition == TransitionType.cupertinoFullScreenDialog,
          builder: builder);
    } else if (transition == TransitionType.fadeOpaque) {
      return PageRouteBuilder<dynamic>(
        opaque: false,
        settings: routeSettings,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return builder(context);
        },
        transitionDuration: transitionDuration,
        transitionsBuilder: _standardTransitionsBuilder(transition),
      );
    } else {
      var routeTransitionsBuilder;
      if (transition == TransitionType.custom) {
        routeTransitionsBuilder = transitionsBuilder;
      } else {
        routeTransitionsBuilder = _standardTransitionsBuilder(transition);
      }
      return PageRouteBuilder<dynamic>(
        settings: routeSettings,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return builder(context);
        },
        transitionDuration: transitionDuration,
        transitionsBuilder: routeTransitionsBuilder,
      );
    }
  }

  static RouteTransitionsBuilder _standardTransitionsBuilder(TransitionType? transitionType) {
    return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == TransitionType.fadeIn || transitionType == TransitionType.fadeOpaque) {
        return FadeTransition(opacity: animation, child: child);
      } else if (transitionType == TransitionType.fadeAndScale) {
        return ScaleTransition(
          child: FadeTransition(opacity: animation, child: child),
          scale: Tween<double>(begin: 0.4, end: 1.0).animate(animation),
        );
      } else if (transitionType == TransitionType.none) {
        return child;
      } else {
        const Offset topLeft = const Offset(0.0, 0.0);
        const Offset topRight = const Offset(1.0, 0.0);
        const Offset bottomLeft = const Offset(0.0, 1.0);
        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == TransitionType.inFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromRight) {
          startOffset = topRight;
          endOffset = topLeft;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }

}
