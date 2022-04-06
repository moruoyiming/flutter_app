/// Flutter 路由控制
class DartRouter {
  /// 测试页面 - toast
  static String toastPage = 'qz_dxs://toastPage';

  ///登录
  static String loginPage = 'qz_dxs://loginPage';

  ///登录 - 绑定手机号 或 忘记密码的验证手机号
  static String loginPhoneBindPage = 'qz_dxs://loginPhoneBindPage';

  ///登录 - 忘记信息页
  static String accountForgetPage = 'qz_dxs://accountForgetPage';

  ///登录 - 账号冲突页
  static String accountClashPage = 'qz_dxs://accountClashPage';

  ///账号 - 设置页
  static String accountCenterMyPage = 'qz_dxs://accountCenterMyPage';

  ///账号 - 注销风险提示页
  static String accountLogoffPresentation =
      'qz_dxs://accountLogoffPresentation';

  ///账号 - 注销
  static String accountLogOff = 'qz_dxs://accountLogOff';

  ///账号 - 修改昵称
  static String accountSetUserNickname = 'qz_dxs://accountSetUserNickname';

  ///账号 - 修改密码
  static String accountSetUserPassword = 'qz_dxs://accountSetUserPassword';

  ///账号 - 修改密码
  static String accountVerificationPhonePage =
      'qz_dxs://accountVerificationPhonePage';

  ///账号 - 三方授权提示
  static String accountAccountUnbindThirdPartPage =
      'qz_dxs://accountAccountUnbindThirdPartPage';

  ///上课 - 缺省页
  static String classNonePage = 'qz_dxs://class/classNonePage';

  ///通用 - WebView
  static String webViewPage = 'qz_dxs://common/webViewPage';
  static String webViewPrivacyPage = 'qz_dxs://common/webViewPrivacyPage';

  ///个人 - 个人页
  static String minePage = 'qz_dxs://mine/minePage';

  ///备考目标 - 设置页
  static String tagetSettingPage = 'qz_dxs://modules/tagetSettingPage';

  ///备考目标 - 专业列表
  static String tagetProfessionListPage =
      'qz_dxs://modules/tagetProfessionListPage';

  ///备考目标 - 专业选择
  static String tagetProfessionSelectPage =
      'qz_dxs://modules/tagetProfessionSelectPage';

  ///备考目标 - 专业搜索
  static String tagetProfessionSearchPage =
      'qz_dxs://modules/tagetProfessionSearchPage';

  static String testOpenMini = 'qz_dxs://modules/openMini';

  static String mineSettingPage = 'qz_dxs://modules/mineSettingPage';

  static List<String> initScheme() {
    List<String> listScheme = [];
    listScheme.add(toastPage);
    listScheme.add(loginPage);
    listScheme.add(loginPhoneBindPage);
    listScheme.add(accountForgetPage);
    listScheme.add(accountClashPage);
    listScheme.add(accountCenterMyPage);
    listScheme.add(accountLogoffPresentation);
    listScheme.add(accountLogOff);
    listScheme.add(accountSetUserPassword);
    listScheme.add(accountSetUserNickname);
    listScheme.add(accountVerificationPhonePage);
    listScheme.add(accountAccountUnbindThirdPartPage);
    listScheme.add(webViewPage);
    listScheme.add(webViewPrivacyPage);
    listScheme.add(minePage);
    listScheme.add(tagetSettingPage);
    listScheme.add(tagetProfessionListPage);
    listScheme.add(tagetProfessionSelectPage);
    listScheme.add(tagetProfessionSearchPage);
    listScheme.add(classNonePage);
    listScheme.add(testOpenMini);
    listScheme.add(mineSettingPage);
    return listScheme;
  }
}
