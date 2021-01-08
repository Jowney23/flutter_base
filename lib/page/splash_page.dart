import 'package:flutter/material.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/common/util/sharedpreference.dart';
import 'package:flutter_app/net/server_api.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  String _data = '我是闪屏哦哦哦哦哦哦哦';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PermissionHandler().requestPermissions([
      PermissionGroup.camera,
      PermissionGroup.storage
    ]).then((permissionMap) {
      permissionMap.forEach((key, value) {
        LogUtil.v("权限名称：${key.toString()}---->权限状态：${value.toString()}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build了哦");
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text(_data),
          RaisedButton(
            child: Text("添加"),
            onPressed: () {
              SpUtil().setStorage("wxy", 569);
            },
          ),
          RaisedButton(
            child: Text("查询"),
            onPressed: (){
              ServerApi().funSample();
              SpUtil().getStorage("wxy").then((value){
                LogUtil.v(value);
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.black12,
    );
  }

  Future<Map<PermissionGroup, PermissionStatus>> checkPermission(List<PermissionGroup> neededPermissions) async {
    Map<PermissionGroup, PermissionStatus> permissionsStatus =
        await PermissionHandler().requestPermissions(neededPermissions);
    permissionsStatus?.forEach((key, value) {
      if(value != PermissionStatus.granted){
        print("无权限"+key.toString());
      }
    });

}
}
