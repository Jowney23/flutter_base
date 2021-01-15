import 'package:dio/dio.dart';

/// @desc  网络请求错误
class HttpError {
  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  ///解析错误
  static const String PARSE_ERROR = "PARSE_ERROR";

  ///网络错误
  static const String NETWORK_ERROR = "NETWORK_ERROR";

  ///协议错误
  static const String HTTP_ERROR = "HTTP_ERROR";

  ///证书错误
  static const String SSL_ERROR = "SSL_ERROR";

  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

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
