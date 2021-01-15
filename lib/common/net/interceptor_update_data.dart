import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/log.dart';
///更改数据
class UpdateDataInterceptor extends Interceptor {
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
   return response;
  }

  void logPrint(Object object) {
    LogUtil.v(object,tag: "update_data_interceptor");
  }
}
