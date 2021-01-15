import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/common/util/sharedpreference.dart';
import 'package:flutter_app/net/server_api.dart';
import 'package:flutter_app/page/base_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app_global.dart';

// ignore: non_constant_identifier_names
final String TAG = "SplashPage";
class SplashPage extends BasePage{

  @override
  Widget childBuild(BuildContext context) {
    return SplashWidget();
  }
}
class SplashWidget extends StatefulWidget {
  @override
  State createState() {
    return _SplashWidgetState();
  }
}

class _SplashWidgetState extends State<SplashWidget> {
  String _data = '我是闪屏哦哦哦哦哦哦哦';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //开源框架已经封装的很好了，没必要二次封装
    PermissionHandler().requestPermissions([
      PermissionGroup.camera,
      PermissionGroup.storage
    ]).then((permissionMap) {
      permissionMap.forEach((key, value) {
        LogUtil.v("权限名称：${key.toString()}---->权限状态：${value.toString()}",
            stackTrace: StackTrace.current);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Global.currentContext = context;
  LogUtil.v("Build执行 ",stackTrace: StackTrace.current);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text("abcdABCD你好",style: TextStyle(fontFamily: 'puhui_light',fontSize: 30),),
          Text("abcdABCD你好",style: TextStyle(fontFamily: 'puhui_regular',fontSize: 30),),
          Text("abcdABCD你好",style: TextStyle(fontFamily: 'puhui_medimu',fontSize: 30),),
          Text("abcdABCD你好",style: TextStyle(fontFamily: 'puhui_bold',fontSize: 30),),
          Text("abcdABCD你好",style: TextStyle(fontFamily: 'puhui_heavy',fontSize: 30),),

          RaisedButton(
            child: Text("添加"),
            onPressed: () {
              SpUtil().setStorage("wxy", 569);
            },
          ),
          RaisedButton(
            child: Text("查询"),
            onPressed: () {
              ServerApi().apiSample();
              SpUtil().getStorage("wxy").then((value) {
                LogUtil.v(value, tag: TAG);
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.black12,
    );
  }
}
