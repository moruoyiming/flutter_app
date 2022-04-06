import 'package:connectivity/connectivity.dart';

class NetWorkUtils {
  /// wifi net work
  static final String NETWORK_WIFI = "wifi";

  /// "2G" networks
  static final String NETWORK_CLASS_2_G = "2G";

  /// "3G" networks
  static final String NETWORK_CLASS_3_G = "3G";

  /// "4G" networks
  static final String NETWORK_CLASS_4_G = "4G";

  static String NETWORK_TYPE = "";

  static bool NETWORK_CONNECTED = true;

  static bool isConnected() {
    isConnectedGet();
    return NETWORK_CONNECTED;
  }

  static Future<bool> isConnectedGet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      NETWORK_CONNECTED = true;
    } else {
      NETWORK_CONNECTED = false;
    }
    return NETWORK_CONNECTED;
  }

  static Future getNetWorkStatus() async {
    var type = NETWORK_WIFI;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      type = NETWORK_CLASS_4_G;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      type = NETWORK_WIFI;
    }
    NETWORK_TYPE = type;
    return type;
  }

  static String getNetWorkType() {
    getNetWorkStatus();
    return NETWORK_TYPE;
  }
}
