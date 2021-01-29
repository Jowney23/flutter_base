import 'dart:io';

import 'package:flutter_app/common/util/log.dart';
import 'package:flutter_app/net/model/project_list.dart';
import 'package:path_provider/path_provider.dart';

/*
// 获取临时文件路径(IOS和安卓通用)
// 不会备份并且随时会被删除的临时目录
// 例如：/data/user/0/com.example.flutter_app/cache
getTemporaryDirectory().then((value) => print(value));

// 获取应用文件目录(IOS和安卓通用)
// 用于放置用户生成的数据或不能有应用程序重新创建的数据 用户不可见
// 例如：/data/user/0/com.example.flutter_app/app_flutter
getApplicationDocumentsDirectory().then((value) => print(value));

// 获取应用支持目录(IOS和安卓通用)
// 用于存储应用支持的目录 这个目录对于用户是不可见的
// 例如：/data/user/0/com.example.flutter_app/files
getApplicationSupportDirectory().then((value) => print(value));

// 获取应用持久存储目录路径(仅IOS可用)
// 应用程序可以存储持久化、备份和用户不可见的文件的目录路径
// 例如：
getLibraryDirectory().then((value) => print(value));

// 获取外部存储目录(仅安卓可用)
// 获取外部存储目录 用户可见
// 例如：/storage/emulated/0/Android/data/com.example.flutter_app/files
getExternalStorageDirectory().then((value) => print(value));

// 获取外部存储目录列表(仅安卓可用)
// 可以存储应用程序特定数据的目录
// 这些路径通常驻留在外部存储上 用户可见 如单独的分区或SD卡(可以有多个 所以是列表)
// 例如：
getExternalStorageDirectories().then((value) => print(value));

// 获取外部缓存目录(仅安卓可用)
// 可以存储应用程序特定外部存储数据的目录
// 这些路径通常驻留在外部存储上，如单独的分区或SD卡(可以有多个 所以是列表)
// 例如：
getExternalCacheDirectories().then((value) => print(value));

// 获取下载目录(仅桌面可用 安卓和IOS报错)
getDownloadsDirectory().then((value) => print(value));
*/

class LocalStorage {
  //天转毫秒系数
  static const int dayToMillisecondsCoefficient  = 24 * 60 * 60 * 1000;

  static LocalStorage _instance;

  factory LocalStorage() => _getInstance();

  LocalStorage._internal();

  static LocalStorage _getInstance() {
    if (_instance == null) {
      _instance = new LocalStorage._internal();
    }
    return _instance;
  }

  /// 创建文件或文件夹
  /// pathName为文件夹路径例如：‘user/zhangjie’
  /// fileName为文件名称例：‘log.txt’
  Future<bool> createExternalFile(String pathName, {String fileName}) async {
    try {
      Directory externalDirectory = await getExternalStorageDirectory();
      Directory directory =
          new Directory('${externalDirectory.path}/$pathName');
      if (!directory.existsSync()) {
        directory.createSync();
      }
      if (fileName == null) {
        return true;
      }
      File file = new File('${directory.path}/$fileName');
      if (!file.existsSync()) {
        file.createSync();
      }
    } catch (e) {
      LogUtil.v("创建文件出错", stackTrace: StackTrace.current);
      return false;
    }
    return true;
  }

  /// 直接删除文件夹 或 文件
  /// pathName为文件夹路径例如：‘user/zhangjie’
  /// fileName为文件名称例：‘log.txt’
  Future<bool> deleteExternalFile(String pathName, {String fileName}) async {
    try {
      Directory externalDirectory = await getExternalStorageDirectory();
      if (fileName != null) {
        File file = File('${externalDirectory.path}/$pathName/$fileName');
        file.deleteSync();
        return true;
      }
      Directory directory = new Directory(pathName);
      if (directory.existsSync()) {
        List<FileSystemEntity> files = directory.listSync();

        if (files.length > 0) {
          files.forEach((item) {
            item.deleteSync();
          });
        }

        directory.deleteSync();
      }
    } catch (e) {
      return false;
    }
    return true;
  }



  /// 获取文件
  /// pathName为文件夹路径例如：‘user/zhangjie’
  /// fileName为文件名称例：‘log.txt’
  /// {day}为文件内容保存天数，当day=0时文件永久保存，如果day>0则文件保存day天后删除重建
  Future<File> getExternalFile(String pathName, String fileName,
      {double day = 0}) async {
    Directory externalDirectory = await getExternalStorageDirectory();
    Directory directory = new Directory('${externalDirectory.path}/$pathName');
    if (!directory.existsSync()) {
      directory.createSync();
    }
    File file = new File('${directory.path}/$fileName');
    if (!file.existsSync()) {
      file.createSync();
    }
    if (day != 0) {
      //文件已存在了existedMilliseconds毫秒
      int existedMilliseconds = DateTime.now().millisecondsSinceEpoch - file.lastAccessedSync().millisecondsSinceEpoch;
      if (existedMilliseconds >= day * dayToMillisecondsCoefficient ) {
        //删除，重建
        file.deleteSync();
        file.createSync();
      }
    }
    return file;
  }
}
