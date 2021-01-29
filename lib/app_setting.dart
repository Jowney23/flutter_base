class AppSettings {
  //判断是release/debug
  static const bool inProduction =
      const bool.fromEnvironment("dart.vm.product");

  //是否打印日志到窗口
  static const bool inPrintLogToConsole = true;

  //是否打印日志到本地
  static const bool inPrintLogToLocal = true;
}
