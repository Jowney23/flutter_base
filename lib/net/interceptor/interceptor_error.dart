import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/log.dart';

///需要统一处理的错误，在这里处理
class ErrorInterceptor extends Interceptor {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    logPrint("response执行了吗？  ${response.data}");
    //返回结果不正确，则人为抛出异常
    Map data = response.data;
    //todo 需要根据具体返回数据格式去修改
    int code = data["code"] != null? data["code"]:-1;
    if (code == 0) {
      return response;
    } else {
      throw DioError(response: response, type: DioErrorType.RESPONSE, error: code);
    }
  }

  @override
  Future<DioError> onError(DioError err) async {
    //todo 解析Response数据后发现异常 则在这里处理根据err.error去处理
    if (err.type == DioErrorType.RESPONSE) {
      if (err.error is int && err.error == 2 || err.error == 3) {
       // logPrint("用户授权认证没有通过!客户端请求参数中无token信息，请登录！");
      }
    }
    return err;
  }
  void logPrint(Object object) {
    LogUtil.v(object,tag: "error_interceptor");
  }
}
