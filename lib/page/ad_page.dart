import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/page/base_page.dart';
import 'package:flutter_app/page/route_util/routeTest.dart';

class ADPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ADPageState();
  }
}

class _ADPageState extends BasePageState<ADPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      //callback function
      //1s 回调一次
      //print('afterTimer=' + DateTime.now().toString());

      timer.cancel();  // 取消定时器
      RouteTest.goProviderTestPage(context);
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    LogUtil.v('ADpage Build');
    // TODO: implement baseBuild
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/img/ad_img.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30, right: 25),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
              ),
              Opacity(
                opacity: 0.9,
                child: RaisedButton(
                  child: Text(
                    '跳过广告',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.white10,
                  splashColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                          color: Color(0xFFFFFFFF),
                          style: BorderStyle.solid,
                          width: 1)),
                  onPressed: () {
                   // Routes.goFirstPage(context);
                    RouteTest.goProviderTestPage(context);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
