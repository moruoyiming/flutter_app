class DeviceInfoUtils {
  static String deviceID = ""; //设备ID uuid、iMEI
  static String deviceIMEI = ""; //设备ID iDFA、iMEI

  static String deviceName = ""; //设备名称 XXX的iPhone、华为
  static String deviceModel = ""; //设备型号
  static String systemVersion = ""; //系统版本

  static setDeviceID(String value) {
    deviceID = value;
  }

  static String getDeviceID() {
    return deviceID;
  }

  static setDeviceIMEI(String value) {
    deviceIMEI = value;
  }

  static String getDeviceIMEI() {
    return deviceIMEI;
  }

  static setDeviceName(String value) {
    deviceName = value;
  }

  static String getDeviceName() {
    return deviceName;
  }

  static setDeviceModel(String value) {
    deviceModel = value;
  }

  static String getDeviceModel() {
    return deviceModel;
  }

  static setSystemVersion(String value) {
    systemVersion = value;
  }

  static String getSystemVersion() {
    return systemVersion;
  }
}
