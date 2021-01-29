import 'dart:io';
import 'dart:ui';

import 'package:flutter_app/common/util/local_storage.dart';

  ///自定义颜色
class AppColors {
   /// 主色
  static const Color c1 = Color.fromRGBO(33, 37, 55, 1);
  static const Color c2 = Color.fromRGBO(40, 44, 63, 1);
  static const Color c3 = Color.fromRGBO(43, 46, 67, 1);
  static const Color c4 = Color.fromRGBO(47, 50, 71, 1);
  static const Color c5 = Color.fromRGBO(66, 68, 88, 1);
  static const Color c6 = Color.fromRGBO(107, 109, 129, 1);
  static const Color c7 = Color.fromRGBO(143, 144, 155, 1);
  static const Color c8 = Color.fromRGBO(255, 255, 255, 1);

   /// 辅色
  static const Color c9 = Color.fromRGBO(58, 120, 242, 1);
  static const Color c10 = Color.fromRGBO(34, 65, 104, 1);
  static const Color c11 = Color.fromRGBO(0, 204, 104, 1);
  static const Color c12 = Color.fromRGBO(223, 81, 83, 1);
}

  ///自定义字号
class AppTextSize {
  static const double textSize1 = 18;
  static const double textSize2 = 16;
  static const double textSize3 = 12;
}

  ///自定义字体
class AppTextFont {
  static const String light = "puhui_light";
  static const String regular = "puhui_regular";
  static const String medium = "puhui_medium";
  static const String bold = "puhui_bold";
  static const String heavy = "puhui_heavy";
}

  ///为了确保国际化，在这里统一定义文本
class AppText {
  static const String button1 = "确认";
}
  ///自定义本地存储文件路径
class AppFilePath {
  static Future<File> getLogPathAndroid() async {
    return LocalStorage().getExternalFile('Logtest', 'log.txt',day: 0.2);
  }
}
  ///自定义时间范围
class AppTimer {

}
