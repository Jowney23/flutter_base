import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_global.dart';
import 'package:flutter_app/page/splash_page.dart';
void main(){
  Global.init().then((value){
    runApp(MyApp());
  });
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SplashWidget(),
        ),
      ),
    );
  }
}
