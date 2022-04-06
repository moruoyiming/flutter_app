class TextUtils {
  static bool isEmpty(String s) {
    return s == null || s.length == 0;
  }

  static String checkString(String value, String defaultValue) {
    return isEmpty(value) ? defaultValue : value;
  }
}
