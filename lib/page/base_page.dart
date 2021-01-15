import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app_global.dart';

abstract class BasePage extends StatefulWidget {
  Widget childBuild(BuildContext context);
  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    //创建Page时可以保存当前页面context
    Global.currentContext = context;
    Global.currentWidget = widget;
    return widget.childBuild(context);
  }
}
