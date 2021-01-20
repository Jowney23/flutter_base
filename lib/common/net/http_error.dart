import 'package:dio/dio.dart';

/// @desc 对网络模块儿错误的统一封装，dioError和其他error（比如说网络是否连接、解析从服务端获取的数据时发生的错误）
/// dioError统一为内部错误（在拦截器的onRequest、onResponse、onError中发生的错误）
/// 其它error统一为外部错误（在拦截器以外发生的错误）
class HttpError {
  ///未知错误
  static const String UNKNOWN = "UNKNOWN";
  ///网络未连接
  static const String NETWORK_NOT_CONNECTED = "NETWORK_NOT_CONNECTED";

  String errorType;

  String message;

  HttpError(this.errorType, this.message);

//将Dio的错误信息再包装一层，可以保证在上层统一处理错误信息
  HttpError.dioError(DioError error) {
    errorType = error.type.toString();
    if(error.type == DioErrorType.RESPONSE){
      message = error.response?.toString();
    }else{
      message = error.message;
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $errorType, message: $message}';
  }
}
