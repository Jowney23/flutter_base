//单利使用DBManager
import 'package:sqflite/sqflite.dart';

class DBManager {
  static DBManager _dbManager;

  factory DBManager() => _getInstance();

  static DBManager _getInstance() {
    if (_dbManager == null) {
      _dbManager = DBManager.internal();
    }
    return _dbManager;
  }
  DBManager.internal();


}
