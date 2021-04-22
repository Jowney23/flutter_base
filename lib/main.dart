import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_global.dart';
import 'package:flutter_app/page/base_page.dart';
import 'package:flutter_app/page/ad_page.dart';
import 'package:flutter_app/page/model/counter_test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(
      create: (context){
        return CounterTest();
      },
    ),
   ],
    child: MyApp(),
  ));
}

class MyApp extends BasePage {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends BasePageState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.initSync();
  }

  @override
  Widget baseBuild(BuildContext context) {
    // TODO: implement baseBuild
    return MaterialApp(
        home: ADPage());
  }
}
