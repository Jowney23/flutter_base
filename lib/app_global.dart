// 提供五套可选主题色
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_setting.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/net/interceptor_error.dart';
import 'package:flutter_app/common/net/interceptor_log.dart';
import 'package:flutter_app/common/net/interceptor_net_cache.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/common/util/sharedpreference.dart';
import 'package:flutter_app/net/server_api.dart';
import 'package:flutter_app/net/server_url.dart';
import 'package:permission_handler/permission_handler.dart';

import 'net/interceptor/interceptor_update_data.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => AppSettings.inProduction;

  //有些控件需要获取当前页面的context
  static BuildContext currentContext;
  static Widget currentWidget;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    //初始化网络请求相关配置
    HttpManager()
        .init(baseUrl: BASE_URL, connectTimeout: 5000, receiveTimeout: 50000,

            ///这个拦截器添加的顺序挺有讲究，日志拦截器放在最后面才能打印出完整的信息
            ///除了LogInterceptor，其他拦截器不要打印日志
            ///除了ErrorInterceptor，其他拦截器不要做错误处理
            ///除了UpdateDataInterceptor，其他拦截器不要修改数据
            interceptors: [
          UpdateDataInterceptor(),
          ErrorInterceptor(),
          LogInterceptor(),
        ]);
    //开发初期，只要定义好服务端的json字段，可以先从本地加载数据
    ServerApi().init(loadDataFromNetWork: true);
  }
}
