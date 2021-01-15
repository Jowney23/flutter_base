import 'package:flutter_app/common/app_setting.dart';

class LogUtil {
  static const String _TAG_DEF = "###tsl_log_infor###";

  static void e(Object object, {String tag = _TAG_DEF}) {
    _printLog(tag, '  e  ', object);
  }

  ///开发阶段推荐使用stackTrace
  static void v(Object object, {String tag = _TAG_DEF, StackTrace stackTrace}) {
    if (AppSettings.inPrintLogToConsole) {
      if(stackTrace != null){
        //#0      _SplashPageState.build.<anonymous closure> (package:flutter_app/page/splash_page.dart:46:44)
        var traceString = stackTrace.toString().split("\n")[0];
        //用正则表达 寻找应该截取的位置
        var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
        //splash_page.dart:46:44)
        var fileInfo = traceString.substring(indexOfFileName);
        var listOfInfos = fileInfo.split(":");
        //splash_page.dart
        var fileName = listOfInfos[0];
        //46
        var lineNumber = int.parse(listOfInfos[1]);
        _printLog("$fileName:$lineNumber  ","", object);
        return ;
      }
      _printLog(tag, '  v  ', object);
    }
  }

  ///往本地打印时记得添加存储权限
  static void vToLocal() {}

  static void _printLog(String tag, String stag, Object object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? "NO Tag " : tag);
    if(stag != null) sb.write(stag);
    sb.write(object);
    String data = sb.toString();
    /**
     * 防止日志过长打印不完全
     */
    while (data.isNotEmpty) {
      if (data.length > 512) {
        print("${data.substring(0, 512)}");
        data = data.substring(512, data.length);
      } else {
        print("$data");
        data = "";
      }
    }
  }
}
