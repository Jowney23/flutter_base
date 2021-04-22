// 提供五套可选主题色
import 'package:flutter/material.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/net/interceptor/interceptor_error.dart';
import 'package:flutter_app/common/net/interceptor_log.dart';
import 'package:flutter_app/net/server_api.dart';
import 'package:flutter_app/net/server_url.dart';

import 'net/interceptor/interceptor_update_data.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  //有些控件需要获取当前页面的context
  static BuildContext currentContext;
  static Widget currentWidget;

  //同步初始化,
  static void initSync() {
    //初始化网络请求相关配置
    HttpManager()
        .init(baseUrl: BASE_URL, connectTimeout: 5000, receiveTimeout: 30000,

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
    LogUtil.v('全局同步初始化完成',stackTrace: StackTrace.current);
  }

  //异步初始化,在界面中执行完build之后才能初始化成功，将两个区分开主要是便于防止还没初始化完成时就调用其中的实例
  static Future initASync() async {}
}
