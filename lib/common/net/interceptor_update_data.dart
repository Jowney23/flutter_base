import 'package:dio/dio.dart';

class UpdateDataInterceptor extends Interceptor {
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu3请求");
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu3响应");
   return response;
  }

  @override
  Future<DioError> onError(DioError err) async {
    return err;
  }
}
