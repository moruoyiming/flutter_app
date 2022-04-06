/// 邮箱正则
final String regexEmail =
    "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

/// 中文正则
final String regexChinese = "[\\u4e00-\\u9fa5]+";

/// 英文正则
final String regexEnglish = "[a-zA-Z]+";

/// 数字正则
final String regexNumber = "[0-9]+";

/// 检查是否是邮箱格式
bool isEmail(String input) {
  if (input == null || input.isEmpty) return false;
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查是否是中文
bool isChinese(String input) {
  if (input == null || input.isEmpty) return false;
  return RegExp(regexChinese).hasMatch(input);
}

/// 检查是否是英文
bool isEnglish(String input) {
  if (input == null || input.isEmpty) return false;
  return RegExp(regexEnglish).hasMatch(input);
}

/// 检查是否是数字
bool isNumber(String input) {
  if (input == null || input.isEmpty) return false;
  return RegExp(regexNumber).hasMatch(input);
}
