
import 'package:flutter/cupertino.dart';

class CounterTest with ChangeNotifier{
  int _number = 0;
  int get number =>_number;
  void add(){
    _number ++;
    notifyListeners();
  }
  void sub(){
    _number--;
    notifyListeners();
  }
}

class CounterTranslations{
  int _value;

  CounterTranslations(this._value);

  String get value=> '当前值为 $_value';
}