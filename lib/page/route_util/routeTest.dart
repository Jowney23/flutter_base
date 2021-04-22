import 'package:flutter/material.dart';
import 'package:flutter_app/common/test_page/provider_page_test.dart';
import 'package:flutter_app/page/route_util/slide_route_builder.dart';

class RouteTest{
  static void goProviderTestPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(SlideRouteBuilder(builder: (context){
      return ProviderTestPage();
    }), (Route<dynamic> route) => false);
  }

}