import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "Loading...";
enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double _progress = 0.0;

bool _isShowing = false;

class ProgressDialog {
  _MyDialog _dialog;

  BuildContext _buildContext, _context;

  ProgressDialog(
      BuildContext buildContext, ProgressDialogType progressDialogtype) {
    _buildContext = buildContext;

    _progressDialogType = progressDialogtype;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
    debugPrint("ProgressDialog message changed: $mess");
  }

  void update({double progress, String message}) {
    debugPrint("ProgressDialog message changed: ");
    if (_progressDialogType == ProgressDialogType.Download) {
      debugPrint("Old Progress: $_progress, New Progress: $progress");
      _progress = progress;
    }
    debugPrint("Old message: $_dialogMessage, New Message: $message");
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(_context).pop();
      debugPrint('ProgressDialog dismissed');
    }
  }

  Future show() async{
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      debugPrint('ProgressDialog shown');
      showDialog(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),//设置原生背景为透明，仅适用自定义背景颜色
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: 20.0,//阴影
              child: _dialog);
        },
      );
    }
    await Future.delayed(Duration(milliseconds: 200));
    return;
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  var _dialog = new _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
    debugPrint('ProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.0,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(children: <Widget>[
            const SizedBox(width: 15.0),
            SizedBox(
              width: 60.0,
              child: Image.asset(
                'assets/gif/double_ring_loading_io.gif',
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: _progressDialogType == ProgressDialogType.Normal
                  ? Text(_dialogMessage,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700))
                  : Stack(
                children: <Widget>[
                  Positioned(
                    child: Text(_dialogMessage,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700)),
                    top: 35.0,
                  ),
                  Positioned(
                    child: Text("$_progress/100",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                    bottom: 15.0,
                    right: 15.0,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}

class MessageBox {
  BuildContext buildContext;
  String message = " ", title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('$title'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
