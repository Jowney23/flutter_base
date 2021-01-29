import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_global.dart';

abstract class BasePage extends StatefulWidget {
//没别的意思 就是为了保持统一
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  //该方法代替原来的build方法
  Widget baseBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    //创建Page时可以保存当前页面context
    Global.currentContext = context;
    Global.currentWidget = widget;
    return baseBuild(context);
  }
}
