import 'package:flutter/material.dart';
import 'package:flutter_app/page/base_page.dart';

class LoginPage extends BasePage{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}
class _LoginPageState extends BasePageState{
  @override
  Widget baseBuild(BuildContext context) {
    // TODO: implement baseBuild
    return Scaffold(
      appBar: AppBar(title: Text('登录'),),
      body: null,
    );
  }

}