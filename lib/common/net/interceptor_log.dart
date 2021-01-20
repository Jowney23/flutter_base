import 'package:dio/dio.dart';
import 'package:flutter_app/common/util/log.dart';

import 'http_error.dart';

/// @desc 拦截器-》打印请求信息，响应信息，错误信息 -------------------->只负责打印日志，不做任何处理
void _log2Console(Object object) {
  LogUtil.v(object, tag: "log_interceptor");
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
    logPrint('--------------------------------------------------------------------------------------------------------');
    logPrint('⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇日志拦截器onRequest  Start⬇⬇⬇⬇⬇⬇⬇⬇⬇');
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
    logPrint("⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆日志拦截器onRequest  End⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆");
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    logPrint('--------------------------------------------------------------------------------------------------------');
    logPrint('⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇日志拦截器onResponse  Start⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇');
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
    logPrint("⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆日志拦截器onResponse  End⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆");
    return response;
  }

  @override
  Future<DioError> onError(DioError err) async {
    if (error) {
      logPrint('--------------------------------------------------------------------------------------------------------');
      logPrint('⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇日志拦截器onError  Start⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇');
      logPrint("~~~日志拦截器只能捕获到 client的onRequest、onResponse、onError中的错误~~~");
      switch (err.type) {
        /// It occurs when url is opened timeout.
        case DioErrorType.CONNECT_TIMEOUT:

        /// It occurs when url is sent timeout.
        case DioErrorType.SEND_TIMEOUT:

        ///It occurs when receiving timeout.
        case DioErrorType.RECEIVE_TIMEOUT:

        /// When the request is cancelled, dio will throw a error with this type.
        case DioErrorType.CANCEL:

        /// Default error type, Some other Error. In this case, you can
        /// use the DioError.error if it is not null.
        case DioErrorType.DEFAULT:
        logPrint("错误类型:${err.type}    错误信息：${err.toString()}");
        break;
      /// When the server response, but with a incorrect status, such as 404, 503...
        case DioErrorType.RESPONSE:
          logPrint("DioError.type:RESPONSE \n                    DioError.error:${err.error} \n                    DioError.response：${err?.response?.toString()}");
          break;
      }
      logPrint('⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆日志拦截器onError  End⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆');
    }
    return err;
  }

  void _printKV(String key, Object v) {
    logPrint('$key: $v');
  }
}
