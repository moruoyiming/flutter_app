//TODO 1.导入包。此行代码作用是导入了Material UI组件库。Material (opens new window)是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件。
import 'dart:developer';
import 'dart:ffi';

import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/LaunchUrlRoute.dart';
import 'package:flutter_app/widgets/container/ClipRoute.dart';
import 'package:flutter_app/widgets/container/ConstrainedBoxRoute.dart';
import 'package:flutter_app/widgets/container/ContainerRoute.dart';
import 'package:flutter_app/widgets/container/PaddingRoute.dart';
import 'package:flutter_app/widgets/container/ScaffoldRoute.dart';
import 'package:flutter_app/widgets/container/TransformRoute.dart';
import 'package:flutter_app/common/net/HttpTestRoute.dart';
import 'package:flutter_app/widgets/scrollable/GridViewRoute.dart';
import 'package:flutter_app/widgets/scrollable/InfiniteGridView.dart';
import 'package:flutter_app/widgets/scrollable/InfiniteListView.dart';
import 'package:flutter_app/widgets/scrollable/ListViewRoute.dart';
import 'package:flutter_app/widgets/scrollable/ListViewRoute2.dart';
import 'package:flutter_app/widgets/scrollable/SingleChildScrollViewRoute.dart';
import 'package:flutter_app/routes/ButtonRoute.dart';
import 'package:flutter_app/routes/CupertinoUIRoute.dart';
import 'package:flutter_app/routes/EchoRoute.dart';
import 'package:flutter_app/widgets/layout/AlignLayoutRoute.dart';
import 'package:flutter_app/widgets/layout/FlexLayoutRoute.dart';
import 'package:flutter_app/widgets/layout/FlowLayoutRoute.dart';
import 'package:flutter_app/routes/FocusTestRoute.dart';
import 'package:flutter_app/routes/FormTestRoute.dart';
import 'package:flutter_app/routes/GestureRoute.dart';
import 'package:flutter_app/routes/ImageRoute.dart';
import 'package:flutter_app/routes/ProgressRoute.dart';
import 'package:flutter_app/widgets/layout/RowLayoutRoute.dart';
import 'package:flutter_app/widgets/layout/StackLayoutRoute.dart';
import 'package:flutter_app/routes/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/routes/TextFieldRoute.dart';
import 'package:flutter_app/routes/TextRoute.dart';
import 'package:flutter_app/routes/TipRoute.dart';
import 'package:flutter_app/common/file/FileOperationRoute.dart';
import 'package:flutter_app/common/net/HttpTestRoute.dart';
import 'package:flutter_app/common/net/FutureBuilderRoute.dart';
import 'routes/NewRoute.dart';
import 'package:flutter_app/routes/ShoppingListItem.dart';
import 'package:flutter_app/widgets/StaggerAnimation.dart';
import 'package:flutter_app/routes/LightonGestureRoute.dart';

//TODO 2.应用入口。
//与C/C++、Java类似，Flutter 应用中main函数为应用程序的入口。main函数中调用了runApp 方法，它的功能是启动Flutter应用。runApp它接受一个Widget参数，在本示例中它是一个MyApp对象，MyApp()是Flutter应用的根组件。
//main函数使用了(=>)符号，这是Dart中单行函数或方法的简写
void main() {
  runApp(MyApp());
}

//TODO 3.应用结构。
//MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
//
// 在Flutter中，大多数东西都是widget（后同“组件”或“部件”），包括对齐(alignment)、填充(padding)和布局(layout)等，它们都是以widget的形式提供。
//
// Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
//
// MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
//
// home 为Flutter应用的首页，它也是一个widget。
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "text_page": (context) => TextRoute(),
        "button_page": (context) => ButtonRoute(),
        "image_page": (context) => ImageRoute(),
        "state_page": (context) => SwitchAndCheckBoxTestRoute(),
        "field_page": (context) => TextFieldRoute(),
        "focus_page": (context) => FocusTestRoute(),
        "tip_page": (context) => TipRoute(text: "what is it"),
        "echo_page": (context) => EchoRoute(),
        "cuper_page": (context) => CupertinoUIRoute(),
        "gesture_page": (context) => GestureRoute(),
        "form_page": (context) => FormTestRoute(),
        "progress_page": (context) => ProgressRoute(),
        "row_page": (context) => RowLayoutRoute(),
        "flex_page": (context) => FlexLayoutRoute(),
        "flow_page": (context) => FlowLayoutRoute(),
        "stack_page": (context) => StackLayoutRoute(),
        "align_page": (context) => AlignLayoutRoute(),
        "padding_page": (context) => PaddingRoute(),
        "constrainedbox_page": (context) => ConstrainedBoxRoute(),
        "transform_page": (context) => TransformRoute(),
        "container_page": (context) => ContainerRoute(),
        "scaffold_page": (context) => ScaffoldRoute(),
        "clip_page": (context) => ClipRoute(),
        "scroll_page": (context) => SingleChildScrollViewRoute(),
        "listview_page": (context) => ListViewRoute(),
        "listview2_page": (context) => ListViewRoute2(),
        "infinite_page": (context) => InfiniteListView(),
        "gridview_page": (context) => GridViewRoute(),
        "gridview2_page": (context) => InfiniteGridView(),
        "file_page": (context) => FileOperationRoute(),
        "net_page": (context) => HttpTestRoute(),
        "future_page": (context) => FutureBuilderRoute(),
        "shop_page": (context) => ShoppingList(
              products: [
                Product(name: 'Eggs'),
                Product(name: 'Flour'),
                Product(name: 'Chocolate chips'),
              ],
            ),
        "animation_page": (context) => StaggerDemo(),
        "lighton_page": (context) => LightonGestureRoute(),
        "launch_page": (context) => LaunchUrlRoute(),
      },
      // //打开命名路由时可能会被调用 如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由
      // onGenerateRoute: (RouteSettings settings){
      //   return MaterialPageRoute(builder: (context){
      //     String routeName = settings.name;
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其它情况则正常打开路由。
      //     print("MaterialPageRoute=routeName"+routeName);
      //   });
      // },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//MyHomePage 是Flutter应用的首页，它继承自StatefulWidget类，表示它是一个有状态的组件（Stateful widget）。关于Stateful widget我们将在第三章“Widget简介”一节仔细介绍，现在我们只需简单认为有状态的组件（Stateful widget） 和无状态的组件（Stateless widget）有两点不同：
//
// Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的。
//
// Stateful widget至少由两个类组成：
//
// 一个StatefulWidget类。
// 一个 State类； StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。
// _MyHomePageState类是MyHomePage类对应的状态类。看到这里，读者可能已经发现：和MyApp 类不同， MyHomePage类中并没有build方法，取而代之的是，build方法被挪到了_MyHomePageState方法中，至于为什么这么做，先留个疑问，在分析完完整代码后再来解答。

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the states. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//State类
// 接下来，我们看看_MyHomePageState中都包含哪些东西：
//
// 1.该组件的状态。由于我们只需要维护一个点击次数计数器，所以定义一个_counter状态：
//  _counter 为保存屏幕右下角带“+”号按钮点击次数的状态。
// 2.设置状态的自增函数。
//  当按钮点击时，会调用此函数，该函数的作用是先自增_counter，然后调用setState 方法。setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
// 3.构建UI界面
// 构建UI界面的逻辑在build方法中，当MyHomePage第一次创建时，_MyHomePageState类会被创建，当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，最终将widget树渲染到设备屏幕上。所以，我们看看_MyHomePageState的build方法中都干了什么事：

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Scaffold 是 Material 库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性，组件树可以很复杂。本书后面示例中，路由默认都是通过Scaffold创建。
    // body的组件树中包含了一个Center 组件，Center 可以将其子组件树对齐到屏幕中心。此例中， Center 子组件是一个Column 组件，Column的作用是将其所有子组件沿屏幕垂直方向依次排列； 此例中Column子组件是两个 Text，第一个Text 显示固定文本 “You have pushed the button this many times:”，第二个Text 显示_counter状态的数值。
    // floatingActionButton是页面右下角的带“+”的悬浮按钮，它的onPressed属性接受一个回调函数，代表它被点击后的处理器，本例中直接将_incrementCounter方法作为其处理函数。
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: new IconButton(
          onPressed: null,
          icon: new Icon(Icons.menu),
          tooltip: "Navigation Menu",
          color: CSSColors.yellow,
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: null,
            icon: new Icon(Icons.search),
            tooltip: "Search",
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Wrap(
              children: [
                TextButton(
                    onPressed: () {
                      //使用路由名打开路由页
                      Navigator.pushNamed(context, "new_page");
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return NewRoute();
                      // }));
                    },
                    // style: TextButton.styleFrom(
                    //   textStyle: TextStyle(fontSize: 20),
                    // ),
                    child: Text("打开新页面")),
                TextButton(
                  onPressed: () async {
                    //打开 TipRoute ，并等待返回结果
                    //使用路由名打开路由页
                    var result3 =
                        await Navigator.pushNamed(context, "tip_page");
                    // var result = await Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return TipRoute(text: "我是提示XXXX");
                    // }));
                    //输出`TipRoute`路由返回结果
                    print("路由返回值: $result3");
                  },
                  child: Text("打开Tip页"),
                ),
                TextButton(
                  onPressed: () async {
                    var result3 = await Navigator.of(context)
                        .pushNamed("echo_page", arguments: "hi man");
                    print("路由返回值: $result3");
                  },
                  child: Text("打开Echo页"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("cuper_page", arguments: "hi man");
                  },
                  child: Text("打开CuperUI页面"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("text_page", arguments: "hi man");
                  },
                  child: Text("文本控件"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("button_page", arguments: "hi man");
                  },
                  child: Text("按钮控件"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("image_page", arguments: "hi man");
                  },
                  child: Text("图片控件"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("state_page", arguments: "hi man");
                  },
                  child: Text("单选开关/复选框控件"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("field_page", arguments: "hi man");
                  },
                  child: Text("输入框及表单"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("focus_page", arguments: "hi man");
                  },
                  child: Text("焦点设置"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("gesture_page", arguments: "hi man");
                  },
                  child: Text("打开gesture页面"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("form_page", arguments: "hi man");
                  },
                  child: Text("输入框即表单"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("progress_page", arguments: "hi man");
                  },
                  child: Text("进度指示器"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("row_page", arguments: "hi man");
                  },
                  child: Text("线性布局"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("flex_page", arguments: "hi man");
                  },
                  child: Text("弹性布局"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("flow_page", arguments: "hi man");
                  },
                  child: Text("流式布局"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("stack_page", arguments: "hi man");
                  },
                  child: Text("层叠布局"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("align_page", arguments: "hi man");
                  },
                  child: Text("对齐与相对定位（Align）"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("padding_page", arguments: "hi man");
                  },
                  child: Text("填充（Padding）"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("constrainedbox_page", arguments: "hi man");
                  },
                  child: Text("装饰容器(DecoratedBox)"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("transform_page", arguments: "hi man");
                  },
                  child: Text("变换(Transform)"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("container_page", arguments: "hi man");
                  },
                  child: Text("组合类容器(Container)"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("scaffold_page", arguments: "hi man");
                  },
                  child: Text("Scaffold、TabBar、底部导航"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("clip_page", arguments: "hi man");
                  },
                  child: Text("剪裁(Clip)"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("scroll_page", arguments: "hi man");
                  },
                  child: Text("SingleChildScrollView"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("listview_page", arguments: "hi man");
                  },
                  child: Text("ListView.builder"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("listview2_page", arguments: "hi man");
                  },
                  child: Text("ListView.separated"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("infinite_page", arguments: "hi man");
                  },
                  child: Text("无限加载列表"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("gridview_page", arguments: "hi man");
                  },
                  child: Text("GridView"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("gridview2_page", arguments: "hi man");
                  },
                  child: Text("InfiniteGridView"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("file_page", arguments: "hi man");
                  },
                  child: Text("FilePage"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("net_page", arguments: "hi man");
                  },
                  child: Text("NetWork"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("future_page", arguments: "hi man");
                  },
                  child: Text("Future"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("shop_page", arguments: "hi man");
                  },
                  child: Text("Shop"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("animation_page", arguments: "hi man");
                  },
                  child: Text("Animation"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("lighton_page", arguments: "hi man");
                  },
                  child: Text("LightONOrOFF"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("launch_page", arguments: "hi man");
                  },
                  child: Text("Launch Url"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
