import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/log.dart';

/// @desc 拦截器-》打印请求信息，响应信息，错误信息
void _log2Console(Object object) {
  LogUtil.v(object,tag: "log_interceptor");
}

class LogInterceptor extends Interceptor {
  LogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.logPrint = _log2Console,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(Object object) logPrint;

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu1请求");
    logPrint('********** Request Info Start**********',);
    _printKV('uri', options.uri);

    if (request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType?.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV('extra', options.extra);
    }
    if (requestHeader) {
      options.headers.forEach((key, v) => _printKV(" $key", v));
    }
    if (requestBody) {
      _printKV("requestBody", options.data);
    }
    logPrint("********** Request Info End**********");
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu1响应");
    logPrint("********** Response Info Start**********");
    _printKV('uri', response.request?.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }
      if (response.headers != null) {
        logPrint("headers:");
        response.headers.forEach((key, v) => _printKV(" $key", v.join(",")));
      }
    }
    if (responseBody) {
      _printKV("responseBody", response.toString());
    }
    logPrint("********** Response Info End**********");
    return response;
  }

  @override
  Future<DioError> onError(DioError err) async {
    if (error) {
      logPrint('********** DioError Info Start**********');
      if (err.message == null) {
        logPrint("异常信息为空");
      } else {
        logPrint("异常信息为：${err.message}");
      }
      logPrint("********** DioError Info End**********");
    }
    return err;
  }

  void _printKV(String key, Object v) {
    logPrint('$key: $v');
  }
}
