import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
  /// 仅供Common使用，可根据项目修改
  const Color toastBackgroundColor = Color.fromRGBO(33, 37, 55, 1);
  const Color toastTextColor = Color.fromRGBO(255, 255, 255, 1);
  const Color c2 = Color.fromRGBO(40, 44, 63, 1);
  const Color c3 = Color.fromRGBO(43, 46, 67, 1);
  const Color c4 = Color.fromRGBO(47, 50, 71, 1);
  const Color c5 = Color.fromRGBO(66, 68, 88, 1);
  const Color c6 = Color.fromRGBO(107, 109, 129, 1);
  const Color c7 = Color.fromRGBO(143, 144, 155, 1);
  const Color c8 = Color.fromRGBO(255, 255, 255, 1);
// 根据项目修改
  const Color c9 = Color.fromRGBO(58, 120, 242, 1);
  const Color c10 = Color.fromRGBO(34, 65, 104, 1);
  const Color c11 = Color.fromRGBO(0, 204, 104, 1);
  const Color c12 = Color.fromRGBO(223, 81, 83, 1);

  const double textSize1 = 18;
  const double textSize2 = 16;
  const double textSize3 = 12;


class DialogHelper {
 /* static showSelect(
      {@required BuildContext context,
        ValueChanged<int> onSelect,
        List<String> items}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          List<Widget> ui = [];
          items.forEach((item) {
            ui.add(
              FlatButton(
                color: cWhite,
                child: Text(item, style: TextStyles.TEXT_L),
                onPressed: () {
                  Navigator.pop(context);
                  if (onSelect != null) onSelect(items.indexOf(item));
                },
              ),
            );
            ui.add(AppDivider());
          });
          ui.add(FlatButton(
            color: cWhite,
            child: Text("取消", style: TextStyles.TEXT_L),
            onPressed: () {
              Navigator.pop(context);
            },
          ));
          return SimpleDialog(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            children: ui,
          );
        });
  }

  static showNotify(
      {@required BuildContext context,
        String content,
        VoidCallback onConfirm,
        String button = "确定"}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: EdgeInsets.all(21),
                    child: Text(
                      content,
                      style: TextStyles.TEXT_L,
                    ),
                  )),
              AppDivider(),
              FlatButton(
                color: cWhite,
                child: Text(button, style: TextStyles.TEXT_L_B),
                onPressed: () {
                  Navigator.pop(context);
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
              )
            ],
          );
        });
  }

  static showInput(
      {@required BuildContext context,
        @required TextEditingController controller,
        String content,
        ValueChanged<String> onConfirm,
        TextInputType keyboardType = TextInputType.number,
        String hint = "",
        bool hideText = false,
        String button = "确定"}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      keyboardType: keyboardType,
                      autofocus: true,
                      controller: controller,
                      obscureText: hideText,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: hint,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cPrimary, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: cDivider, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)))))),
              AppDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: FlatButton(
                      color: cWhite,
                      child: Text("取消", style: TextStyles.TEXT_L),
                      onPressed: () {
                        Navigator.pop(context);
                        controller.clear();
                      },
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      color: cWhite,
                      child: Text(button, style: TextStyles.TEXT_L_B),
                      onPressed: () {
                        Navigator.pop(context);
                        if (onConfirm != null) {
                          onConfirm(controller.text);
                        }
                        controller.clear();
                      },
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  static showConfirm(
      {@required BuildContext context,
        String content,
        ValueChanged<bool> confirm,
        String buttonP = "确定",
        String buttonN = "取消"}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: EdgeInsets.all(21),
                    child: Text(
                      content,
                      style: TextStyles.TEXT_L,
                    ),
                  )),
              AppDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: FlatButton(
                      color: cWhite,
                      child: Text(buttonN, style: TextStyles.TEXT_L),
                      onPressed: () {
                        Navigator.pop(context);
                        if (confirm != null) {
                          confirm(false);
                        }
                      },
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      color: cWhite,
                      child: Text(buttonP, style: TextStyles.TEXT_L_B),
                      onPressed: () {
                        Navigator.pop(context);
                        if (confirm != null) {
                          confirm(true);
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
*/
  static ProgressDialog _loading;
  static BuildContext _buildContext;

  static Future loading({BuildContext context, String message = "加载中"}) async {
    stopLoading();
    if (_buildContext != context) {
      _loading = new ProgressDialog(context, ProgressDialogType.Normal);
      _buildContext = context;
    }
    _loading.setMessage(message);
    try {
      await _loading.show();
    } catch (e) {}
    return;
  }

  static stopLoading() async {
    if (_loading != null && _loading.isShowing()) {
      try {
        _loading.hide();
      } catch (e) {
        await Future.delayed(Duration(milliseconds: 200));
        try {
          _loading.hide();
        } catch (e) {}
      }
    }
  }
}

class ToasterHelper {
  static show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: toastBackgroundColor,
        textColor: toastTextColor);
  }
}

