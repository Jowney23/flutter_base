import 'package:flutter/material.dart';
//展示Button样式，使用时可以选择
class ButtonListPage extends StatefulWidget{

  @override
  State createState() {
    return _ButtonListPageState();
  }
}
class _ButtonListPageState extends State<ButtonListPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Text("data"),
          RaisedButton(
            onPressed: (){
              print("object1");
            },
          ),
          RaisedButton(onPressed: (){
            print("object2");
          },
          ),
          RaisedButton(
            child: Text('普通按钮'),
            onHighlightChanged:(bool b) {
              print(b);
            },
            onPressed: (){},
          ),

          RaisedButton(
            child: Text('带颜色'),
            onPressed: (){},
            textColor: Colors.white,
            color: Colors.blue[200],
          ),

          RaisedButton(
            child: Text('带颜色带阴影'),
            onPressed: (){},
            textColor: Colors.white,
            color: Colors.blue[200],
            elevation: 15,
          ),

          Container(
            width: 300,
            height: 50,
            child: RaisedButton(
              child: Text('设置宽高'),
              onPressed: (){},
              textColor: Colors.white,
              color: Colors.blue[500],
              elevation: 15,
            ),
          ),

          RaisedButton.icon(
            icon: Icon(Icons.account_box),
            label: Text('我前边有图标'),
            onPressed: () {},
          ),

          RaisedButton(
            child: Text('圆角按钮'),
            onPressed: (){},
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),

          Container(
            width: 100,
            height: 100,
            child: RaisedButton(
                child: Text('圆形按钮'),
                onPressed: (){},
                color: Colors.red,
                shape: CircleBorder(
                  // side: BorderSide(color: Colors.yellow[500])
                )
            ),
          ),

          RaisedButton(
            child: Text('水波纹'),
            onPressed: (){},
            color: Colors.blue[200],
            splashColor:Colors.yellow[100],
          ),

          RaisedButton(
            child: Text('长按变色'),
            onPressed: (){},
            color: Colors.blue[200],
            highlightColor:Colors.red[500],
          ),

          FlatButton(
            child: Text('扁平按钮'),
            onPressed: (){},
            color: Colors.blue[200],
          ),

          OutlineButton(
            child: Text('边框按钮'),
            onPressed: (){},
            textColor: Colors.red,
            borderSide: BorderSide(color: Colors.red,),
          ),

          IconButton(
            icon: Icon(Icons.access_alarms),
            onPressed: () {},
            color: Colors.deepOrange,
            splashColor:Colors.limeAccent,
            highlightColor:Colors.blue[300],
            tooltip:'干啥',
          ),
        ],
      ),
    );
  }
}