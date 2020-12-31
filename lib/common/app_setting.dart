class AppSettings{
  //判断是release/debug
  static const bool inProduction = const bool.fromEnvironment("dart.vm.product");

}