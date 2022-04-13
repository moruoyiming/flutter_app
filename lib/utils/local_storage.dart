import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QZLocalStorage {
  /// 单例缓存工具类
  factory QZLocalStorage() => _getInstance();

  static QZLocalStorage get instance => _getInstance();
  static late QZLocalStorage _instance;

  static QZLocalStorage _getInstance() {
    if (_instance == null) {
      _instance = QZLocalStorage._internal();
      _instance._configUtils();
    }
    return _instance;
  }

  QZLocalStorage._internal();

  ///持有对象
  late SharedPreferences _sharedPrefs;

  /// 初始化方法
  _configUtils() {
    _configSharePrefs();
  }

  _configSharePrefs() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  /// 准备
  prepare(Function succes) async {
    _sharedPrefs = await SharedPreferences.getInstance();
    succes?.call();
  }

  /// 删除
  remove(String key) {
    return _sharedPrefs.remove(key);
  }

  /// 清空
  clear() {
    return _sharedPrefs.clear();
  }

  setString(String key, value) async {
    bool result = await _sharedPrefs.setString(key, value);
    return result;
  }

  String? getString(String key) {
    if (_sharedPrefs.containsKey(key)) {
      return _sharedPrefs.getString(key);
    }
    return null;
  }

  setInt(String key, value) async {
    bool result = await _sharedPrefs.setInt(key, value);
    return result;
  }

  int getInt(String key) {
    if (_sharedPrefs.containsKey(key)) {
      return _sharedPrefs.getInt(key);
    }
    return 0;
  }

  setBool(String key, value) async {
    bool result = await _sharedPrefs.setBool(key, value);
    return result;
  }

  bool getBool(String key) {
    if (_sharedPrefs.containsKey(key)) {
      return _sharedPrefs.getBool(key);
    }
    return false;
  }

  bool getBoolDefaul(String key, bool defaultBool) {
    if (_sharedPrefs.containsKey(key)) {
      return _sharedPrefs.getBool(key);
    }
    return defaultBool;
  }
}
