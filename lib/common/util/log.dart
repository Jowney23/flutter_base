import 'package:flutter_app/common/app_setting.dart';

class LogUtil {
  static const String _TAG_DEF = "###tsl_log_infor###";
  static void e(Object object, {String tag = _TAG_DEF}) {
    _printLog(tag, '  e  ', object);
  }

  static void v(Object object, {String tag = _TAG_DEF}) {
    if (AppSettings.inPrintLog) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? "NO Tag " : tag);
    sb.write(stag);
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
