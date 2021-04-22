import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//展示Button样式，使用时可以选择
class ButtonListPage extends StatefulWidget {
  @override
  State createState() {
    return _ButtonListPageState();
  }
}

class _ButtonListPageState extends State<ButtonListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        padding: EdgeInsets.only(top: 30, left: 30, bottom: 30),
        child: ListView(
          children: <Widget>[
            Wrap(
              runSpacing: 30,
              spacing: 50,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: RaisedButton(
                    child: Text('RaisedButton设置宽高'),
                    textColor: Colors.white,
                    //背景颜色
                    color: Colors.blue,
                    //长按颜色
                    highlightColor: Colors.red,
                    //点击时波纹颜色
                    splashColor: Colors.amber,
                    //设置阴影
                    elevation: 15,
                    onPressed: () {},
                    onHighlightChanged: (bool b) {
                      //按下是true 抬起时false
                      print(b);
                    },
                  ),
                ),

                RaisedButton.icon(
                  icon: Icon(Icons.account_box),
                  label: Text('RaisedButton'),
                  onPressed: () {},
                ),

                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: () {},
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                RaisedButton(
                  child: Text('RaisedButton'),
                  color: Colors.red,
                  shape:  StadiumBorder(side: BorderSide(width: 2, style: BorderStyle.solid, color: Color(0xFF00FFFF))),
                ),
                RaisedButton(
                  child: Text('RaisedButton'),
                  color: Colors.red,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2)),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: RaisedButton(
                      child: Text('RaisedButton'),
                      onPressed: () {},
                      color: Colors.red,
                      shape: CircleBorder(
                          // side: BorderSide(color: Colors.yellow[500])
                          )),
                ),

                FlatButton(
                  child: Text('FlatButton'),
                  onPressed: () {},
                  color: Colors.blue[200],
                ),
                //背景透明哦
                OutlineButton(
                  child: Text('OutlineButton'),
                  onPressed: () {},
                  textColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),

                IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.home),
                  onPressed: () {},
                  color: Colors.deepOrange,
                  splashColor: Colors.limeAccent,
                  //点击时波纹颜色
                  highlightColor: Colors.blue, //长按时颜色
                  tooltip: 'IconButton',
                ),
                RaisedButton(
                  //实现不规则圆角操作 //基于RaisedButton自定义Button
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(0),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(270),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(270))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        fadeInDuration: Duration(milliseconds: 100),
                        placeholder: 'assets/img/ad_img.png', //占位符
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      Text(
                        '你好',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
