import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/log.dart';

//需要统一处理的地方可以在这里操作
class ErrorInterceptor extends Interceptor {
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu2请求");
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu2响应");
    //返回结果不正确，则人为抛出异常
    Map data = response.data;
    //todo 需要根据具体返回数据格式去修改
    int code = data["code"];
    if (code == 0) {
      // response.data = data["data"];
      return response;
    } else {
      throw DioError(
          response: response, type: DioErrorType.RESPONSE, error: code);
    }
  }

  @override
  Future<DioError> onError(DioError err) async {
    //todo 解析Response数据后发现异常 则在这里处理根据err.error去处理
    if (err.type == DioErrorType.RESPONSE) {
      if (err.error is int && err.error == 2 || err.error == 3) {
        logPrint("用户授权认证没有通过!客户端请求参数中无token信息，请登录！");
      }
    }
    return err;
  }
  void logPrint(Object object) {
    LogUtil.v(object,tag: "error_interceptor");
  }
}
