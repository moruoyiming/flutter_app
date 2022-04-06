/// 文案资源
class StringResource {
  static const String loginTitle = '登录页';
  static const String loginErrorTipsTitle = '登录页错误提示';
}

const String netConnect = '请连接网络';

class QZURL {
  static const String qzPrivacyURL = 'https://hd.kmf.com/term/qz-privacy'; // online
  static const String dxsPrivacyURL = 'https://hd.kmf.com/term/dxs-privacy'; // happy
  static const String qzDisclaimerURL = 'https://hd.kmf.com/term/qz-disclaimer';
}

/// SDK Value
//Bugle
class QZBuglySDKConfig {
  static const String iosAppIdDebug = 'cb6358edd0';
  static const String iosAppId = 'a9dea961fb';

  static const String iosAppKeyDebug = '87a2cdf3-7ed0-425e-bef0-7fd0510c3be6';
  static const String iosAppKey = 'c84bd634-a37c-49aa-b9c2-0a5e5859c4f9';

  static const String androidAppIdDebug = '9f223fe5f0';
  static const String androidAppId = '292b282857';

  static const String androidAppKeyDebug = 'de2cb10f-389d-4ec8-8859-4daa87cff209';
  static const String androidAppKey = 'd5f2ebec-2886-4786-a47c-94db13212a95';
}

//TAL
class QZClientID {
  static const String iosClientId = '392101';
  static const String androidClientId = '392201';
}

//本地环境
class QZEnvironment {
  static const int envUser = 0;
  static const int envBeta = 1;
  static const int envTest = 2;
}

//登录状态场景
class QZLoginTypeKey {
  static const int logOut = 0; //用户退出
  static const int logIn = 1; //用户登录
  static const int logCancel = 2; //用户关闭登录
  static const int loginKeep = 3; //打开app-用户登录
}

//本地环境 拼接字段
class QZEnvironmentSplicing {
  static const String ONLINE = "online"; //线上
  static const String TEST = "test"; //测试
  static const String BEAT = "beta"; //预发布
}

//登录方式
class QZLoginMode {
  static const int loginModeNone = 0;
  static const int loginModeSMS = 1;
  static const int loginModePSD = 2;
  static const int loginModeAP = 3;
  static const int loginModeWX = 4;
  static const int loginModeWB = 5;
  static const int loginModeQQ = 6;
}

//缓存值
class QZLocakKey {
  static const String appEnvironmentKey = 'QZAppEnvironmentKey';
  static const String loginLastModeKey = 'QZLoginLastModeKey';
  static const String userInfoKey = 'QZUserInfoKey';
  static const String userTagetCompany = 'QZUserTagetCompanyKey';
  static const String setProxyAuto = 'setProxyAuto'; // 设置代理
  static const String setADOpenAuto = 'AD_OPEN_AUTO'; //设置个性化广告推荐

  static const String permissionStorage = 'QZPermissionStorage';
  static const String permissionCamera = 'QZPermissionCamera';
}

//账号消息通道
class AccountChannelKey {
  static const String appModeKey = 'QZAppModeChannel';
  static const String thirdAuthKey = 'QZThirdAuthChannel';
  static const String loginTypeKey = 'QZLoginTypeChannel';
  static const String accountTalKey = 'QZAccountTALChannel';
  static const String userPhotoKey = 'QZUserPhotoChannel';
  static const String userInformation = 'QZUserInformationChannel';
  static const String userQuickLoginKey = "QZUserQuickLoginChannel";
  static const String userPrivacyAgree = 'QZUserPrivacyAgree';
  static const String qzDeviceInfo = 'QZDeviceInfo';
  static const String qzPhoneInfo = 'QZPhoneInfo';
}

/// 手机号验证码类型
class LoginPhoneBindType {
  static const String bindPhone = 'bindPhone'; //登录流程 强绑手机号 绑定接口 合并账号
  static const String authPhoneLogin = 'authPhoneLogin'; //三方授权 新用户 登录接口
  static const String forgetPassword = 'forgetPassword'; //忘记密码 - 验证手机号
  static const String changePhone = 'changePhone'; //换榜流程 - 绑定新手机号
  static const String login = 'login'; //验证码登录
  static const String accountMerge = 'accountMerge'; //启动流程 强绑手机号 绑定接口 合并账号
}

//轻舟消息通道 - 个人
// class QZMineChannelKey {
//   static const String feedbackChannel = 'QZFeedbackChannel';
//   static const String orderCenterChannel = 'QZOrderCenterChannel';
// }

//android 广告位
class QZAdversionAndroidKey {
  //出国
  static const String qzToeflBanner = 'qingzhouandroid_course_index_toefl';
  static const String qzIeltsBanner = 'qingzhouandroid_course_index_ielts';
  static const String qzGreBanner = 'qingzhouandroid_course_index_gre';
  static const String qzGmatBanner = 'qingzhouandroid_course_index_gmat';
  //考研
  static const String qzkaoyanBanner1 = 'qingzhouandroid_course_index1_FlashPic1';
  static const String qzkaoyanBanner2 = 'qingzhouandroid_course_index1_FlashPic2';
  static const String qzkaoyanBanner3 = 'qingzhouandroid_course_index1_FlashPic3';
  static const String qzkaoyanBanner4 = 'qingzhouandroid_course_index1_FlashPic4';
}

//iOS 广告位
class QZAdversionIosdKey {
  static const String qzToeflBanner = 'qingzhouios_course_index_toefl';
  static const String qzIeltsBanner = 'qingzhouios_course_index_ielts';
  static const String qzGreBanner = 'qingzhouios_course_index_gre';
  static const String qzGmatBanner = 'qingzhouios_course_index_gmat';
  //考研
  static const String qzkaoyanBanner1 = 'qingzhouios_course_index1_FlashPic1';
  static const String qzkaoyanBanner2 = 'qingzhouios_course_index1_FlashPic2';
  static const String qzkaoyanBanner3 = 'qingzhouios_course_index1_FlashPic3';
  static const String qzkaoyanBanner4 = 'qingzhouios_course_index1_FlashPic4';
}

// 上课 课程类型
class QZClassTypeKey {
  static const int classNotOpen = 0; //未开始 样式==未开课
  static const int classBeIn = 1; // 进行中
  static const int classBaBack = 2; //退课中 样式==未开课
  static const int classOver = 3; //已结束
  static const int classExpired = 4; //已过期
  static const int classDelay = 5; //已延期 样式==已结束
  static const int classNotConfig = 6; //配置中 样式==灰色配置中
  static const int classBeConfig = 7; // 配置中 样式==高亮配置中
}
