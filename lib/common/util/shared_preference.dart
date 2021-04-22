import 'dart:convert';

import 'package:flutter_app/common/util/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 封装SharedPreferences为单例模式
class SpUtil {
  /// 静态私有实例对象
  static final _instance = SpUtil._init();

  /// 工厂构造函数 返回实例对象
  factory SpUtil() => _instance;

  /// SharedPreferences对象
  static SharedPreferences _sp;

  /// 命名构造函数 用于初始化SharedPreferences实例对象
  SpUtil._init() {
    _initStorage();
  }

  // 之所以这个没有写在 _init中，是因为SharedPreferences.getInstance是一个异步的方法 需要用await接收它的值
  _initStorage() async {
    // 若_不存在 则创建SharedPreferences实例
    if (_sp == null) _sp = await SharedPreferences.getInstance();
  }

  /// 设置存储
  setStorage(String key, dynamic value) async {
    await _initStorage();
    String type;
    // 监测value的类型 如果是Map和List,则转换成JSON，以字符串进行存储
    if (value is Map || value is List) {
      type = 'String';
      value = JsonEncoder().convert(value);
    }
    // 否则 获取value的类型的字符串形式
    else {
      type = value.runtimeType.toString();
      LogUtil.v("SharedPreference存储类型数据类型$type",stackTrace: StackTrace.current);
    }
    // 根据value不同的类型 用不同的方法进行存储
    switch (type) {
      case 'String':
        _sp.setString(key, value);
        break;
      case 'int':
        _sp.setInt(key, value);
        break;
      case 'double':
        _sp.setDouble(key, value);
        break;
      case 'bool':
        _sp.setBool(key, value);
        break;
    }
  }

  /// 获取存储 注意：返回的是一个Future对象 要么用await接收 要么在.then中接收
  Future<dynamic> getStorage(String key) async {
    await _initStorage();
    // 获取key对应的value
    dynamic value = _sp.get(key);
    // 判断value是不是一个json的字符串 是 则解码
    if (_isJson(value)) {
      return JsonDecoder().convert(value);
    } else {
      // 不是 则直接返回
      return value;
    }
  }

  /// 是否包含某个key
  Future<bool> hasKey(String key) async {
    await _initStorage();
    return _sp.containsKey(key);
  }

  /// 删除key指向的存储 如果key存在则删除并返回true，否则返回false
  Future<bool> removeStorage(String key) async {
    await _initStorage();
    if (await hasKey(key)) {
      await _sp.remove(key);
      return true;
    } else {
      return false;
    }
    // return  _storage.remove(key);
  }

  /// 清空存储 并总是返回true
  Future<bool> clear() async {
    await _initStorage();
    _sp.clear();
    return true;
  }

  /// 获取所有的key 类型为Set<String>
  Future<Set<String>> getKeys() async {
    await _initStorage();
    return _sp.getKeys();
  }

  // 判断是否是JSON字符串
  _isJson(dynamic value) {
    try {
      // 如果value是一个json的字符串 则不会报错 返回true
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      // 如果value不是json的字符串 则报错 进入catch 返回false
      return false;
    }
  }
}
