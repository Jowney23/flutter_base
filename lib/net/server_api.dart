//对common中网络操作的二次封装，主要封装业务逻辑
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/net/server_url.dart';

import 'model/project_list.dart';

class ServerApi {
  bool _loadDataFromNetWork = true;

  //用于前期开发 模拟接口
  String _loadDataPath = "assets/json/net_response";

  factory ServerApi() => _instance;
  static final ServerApi _instance = ServerApi._internal();

  ServerApi._internal();

  ///初始化时给定数据来源
  void init({bool loadDataFromNetWork = true}) {
    _loadDataFromNetWork = loadDataFromNetWork;
  }

  ///该方法用于参考,实际开发中可删除
  funSample() {
    if (!_loadDataFromNetWork) {
      rootBundle.loadString(_loadDataPath + "project_tree.json").then((value) {
        ProjectList result = ProjectList.fromJson(json.decode(value));
      });
    }
    HttpManager()
        .getAsync<ProjectList>(
            url: GET_PROJECT_TREE_URL,
            tag: GET_PROJECT_TREE_URL,
            params: {"rootId": -1},
            jsonParse: (value) {
              return ProjectList.fromJson(value);
            })
        .then((value) {

    }).catchError((error){
      LogUtil.v(error.toString(),tag: "ServerApi.class");
    });
  }

}
