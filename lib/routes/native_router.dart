/// 原生路由控制
class NativeRouter {
  /// 我的订单
  static String orderCenter = 'qz_dxs://mine/orderCenter';

  /// 反馈投诉
  /// 参数：Map类型：
  /// type，String类型：0 默认 1 账号相关
  static String feedback = 'qz_dxs://common/feedback';

  /// 课程详情页
  /// 参数：Map类型：
  /// courseId，String类型
  /// courseName，String类型
  static String classDetail = 'qz_dxs://class/classDetail';

  /// 测试页面
  static String testPage = 'qz_dxs://test/testPage';

  /// 跳转广告
  /// 地址：’qz_dxs://gotoAdvertisementPage’;
  ///参数：
  ///String id;
  ///String showType;
  ///String linkUrl;
  ///int activityId;
  ///String title
  static String advertisementPage = 'qz_dxs://gotoAdvertisementPage';

  ///参数：
  ///int classId;
  static String gotoGloLive = 'qz_dxs://gotoGloLive';

  ///跳转 选课webview
  ///参数：
  ///String linkUrl；
  static String gotoQZWebViewPage = 'qz_dxs://gotoQZWebViewPage';

  ///跳转到考研h5, 再跳转去CC直播、录播、回放
  static String gotoKYCoursePage = 'qz_dxs://gotoKYCoursePage';

  ///跳转到课程缓存列表页
  static String gotoCourseCache = 'qz_dxs://gotoCourseCache';

  ///跳转到直播云
  static String gotoOpenZhiboyunLive = 'qz_dxs://gotoOpenZhiboyunLive';

  static List<String> initScheme() {
    List<String> listScheme = [];
    listScheme.add(orderCenter);
    listScheme.add(classDetail);
    listScheme.add(feedback);
    listScheme.add(testPage);
    listScheme.add(advertisementPage);
    listScheme.add(gotoGloLive);
    listScheme.add(gotoQZWebViewPage);
    listScheme.add(gotoKYCoursePage);
    listScheme.add(gotoCourseCache);
    listScheme.add(gotoOpenZhiboyunLive);
    return listScheme;
  }
}
