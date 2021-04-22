
import 'package:flutter/material.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/common/util/shared_preference.dart';
import 'package:flutter_app/net/server_api.dart';
import 'package:flutter_app/page/base_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'model/counter_test.dart';
// ignore: must_be_immutable
class FirstPage extends BasePage {

@override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends BasePageState<FirstPage> {
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
  Widget baseBuild(BuildContext context) {
    LogUtil.v("FirstPage Build", stackTrace: StackTrace.current);
    CounterTest countProvider =  Provider.of<CounterTest>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Text(
            "abcdABCD你好",
            style: TextStyle(fontFamily: 'puhui_light', fontSize: 30),
          ),
          Text(
            "abcdABCD你好",
            style: TextStyle(fontFamily: 'puhui_regular', fontSize: 30),
          ),
          Text(
            "abcdABCD你好",
            style: TextStyle(fontFamily: 'puhui_medium', fontSize: 30),
          ),
          Text(
            "abcdABCD你好",
            style: TextStyle(fontFamily: 'puhui_bold', fontSize: 30),
          ),
          Text(
            "abcdABCD你好",
            style: TextStyle(fontFamily: 'puhui_heavy', fontSize: 30),
          ),
          RaisedButton(
            child: Text("添加 "),
            onPressed: () {
              SpUtil().setStorage("wxy", 569);
              countProvider.add();
            },
          ),
          RaisedButton(
            child: Text("查询${countProvider.number}"),
            onPressed: () {
              ServerApi().apiSample();

            },
          ),
        ],
      ),
      backgroundColor: Colors.amber,
    );
  }
}
