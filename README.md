# flutter_app

A new Flutter application.

## Getting Started

## StatelessWidget/StatefulWidget类
 1.StatelessWidget类:表示它是一个无状态的组件（Stateless widget）
 2.StatefulWidget类:表示它是一个有状态的组件（Stateful widget）

    不同点
    Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的。
    Stateful widget至少由两个类组成：
    一个StatefulWidget类。
    一个 State类； StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。


## 界面更新原理
当按钮点击时，会调用此函数，该函数的作用是先自增_counter，然后调用setState 方法。setState方法的作用是通知Flutter框架，
有状态发生了改变，Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，
使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。


## MaterialPageRoute

MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。MaterialPageRoute 是Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：

对于Android，当打开新页面时，新的页面会从屏幕底部滑动到屏幕顶部；当关闭页面时，当前页面会从屏幕顶部滑动到屏幕底部后消失，同时上一个页面会显示到屏幕上。
对于iOS，当打开页面时，新的页面会从屏幕右侧边缘一致滑动到屏幕左边，直到新页面全部显示到屏幕上，而上一个页面则会从当前屏幕滑动到屏幕左侧而消失；当关闭页面时，正好相反，当前页面会从屏幕右侧滑出，同时上一个页面会从屏幕左侧滑入。

  MaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })

  builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
  settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
  maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
  fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。


## Navigator
   Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈，在此我们只介绍其最常用的两个方法：
Future push(BuildContext context, Route route)
将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。

bool pop(BuildContext context, [ result ])
将栈顶路由出栈，result为页面关闭时返回给上一个页面的数据。

Navigator 还有很多其它方法，如Navigator.replace、Navigator.popUntil等，详情请参考API文档或SDK源码注释，在此不再赘述。下面我们还需要介绍一下路由相关的另一个概念“命名路由”。

## 路由管理
    //导航到新路由
     Navigator.push( context,
      MaterialPageRoute(builder: (context) {
         return NewRoute();
      }));
    //路由传值
    Navigator.pop(context, "我是返回值")

## 路由表
     在MyApp类的build方法中找到MaterialApp，添加routes属性
     //注册路由表
     routes:{
      "new_page":(context) => NewRoute(),
       ... // 省略其它路由注册信息
     } ,
## 通过路由名打开新路由页
    Future pushNamed(BuildContext context, String routeName,{Object arguments})
    例：
    Navigator.pushNamed(context, "new_page");

## 获取路由参数
   ModalRoute.of(context).settings.arguments;

## 传递路由参数
   Navigator.of(context).pushNamed("new_page", arguments: "hi");

## 路由跳转前置处理逻辑
   通过onGenerateRoute做一些全局的路由跳转前置处理逻辑
