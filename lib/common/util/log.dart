
import 'dart:io';

import 'package:flutter_app/app_setting.dart';
import 'package:flutter_app/common/widget/widget_helper.dart';

class LogUtil {
  static const String _TAG_DEF = "###tsl_log_infor###";

  static void e(Object object, {String tag = _TAG_DEF}) {
    _printLog(tag, '  e  ', object);
  }

  ///开发阶段推荐使用stackTrace
  static void v(Object object, {String tag = _TAG_DEF, StackTrace stackTrace}) {
    if (AppSettings.inPrintLogToConsole) {
      if (stackTrace != null) {
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
        _printLog("$fileName:$lineNumber  ", "", object);
        return;
      }
      _printLog(tag, '  v  ', object);
    }
  }

  ///说明: 往本地打印时记得添加存储权限
  ///logFile 是要往本地存储的log文件
  ///description 是自定义描述
  ///object 是文本内容
  ///这样做的目的：由于app_global.dart文件中无法直接初始化得到File，所以直接将Future穿进去
  static void vToLocal(Future<File> logFile,String description,Object object) {
    if(AppSettings.inPrintLogToLocal){
      logFile.then((file){
        LogUtil.v('${file.lastAccessedSync()}');
        file.writeAsString('\n <-----------${DateTime.now()}日志描述:$description----------->\n $object \n',mode:FileMode.append);
      }).catchError((error){
        ToasterHelper.show('本地存储日志失败:$error');
      });
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    StringBuffer sb = new StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? "NO Tag " : tag);
    if (stag != null) sb.write(stag);
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
