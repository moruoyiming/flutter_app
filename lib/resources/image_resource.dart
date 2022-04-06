/// 图片资源
class ImageName {
  /// 获取本地图片
  /// name：图片名
  String png(String name) {
    return module + name + ".png";
  }

  String jpeg(String name) {
    return module + name + ".jpeg";
  }

  String gif(String name) {
    return module + name + ".gif";
  }

  String getHtml(String name) {
    return module + name + ".html";
  }

  /// 根路径下
  static String get _homePath => "resources/";

  /// 通用
  static ImageName get common => ImageName(_homePath + "common/");

  /// 我的
  static ImageName get mine => ImageName(_homePath + "mine/");

  /// 刷新
  static ImageName get anim => ImageName(_homePath + "anim/");

  /// 登录
  static ImageName get login => ImageName(_homePath + "login/");

  ///gif
  static ImageName get gifResourse => ImageName(_homePath + "gif/");

  /// 课程
  static ImageName get modules => ImageName(_homePath + "course/");

  /// 上课
  static ImageName get classHome => ImageName(_homePath + "class/");

  /// 目标设置
  static ImageName get taget => ImageName(_homePath + "taget/");

  ///gif
  static ImageName get html => ImageName(_homePath + "html/");

  final String module;
  ImageName(this.module);
}
