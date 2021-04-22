import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/page/base_page.dart';
import 'package:provider/provider.dart';

/// 文档写在这里方便以后查看
/// 主要种类的作用：
/// Provider :Consumer以获取Model的数据，但是Model数据发生改变时无法通知Consumer
/// FutureProvider: Consumer以异步获取Model的数据，并且异步初始化Model，但是Model数据发生改变时无法通知Consumer，与FuturBuilder相似
/// ChangeNotifierProvider ：Consumer可以监听到Model数据的改变，从而刷新Consumer(同步的)
/// ListenableProvider
/// ValueListenableProvider
/// StreamProvider

/// MultiProvider
/// ProxyProvider
/// ChangeNotifierProxyProvider
///
class ProviderTestPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProviderTestPageState();
  }
}

class _ProviderTestPageState extends BasePageState {
  @override
  Widget baseBuild(BuildContext context) {
    // TODO: implement baseBuild
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(
          //               <--- ChangeNotifierProvider
          create: (context) => MyModel(),
        ),
        ProxyProvider<MyModel, AnotherModel>(
          //          <--- ProxyProvider
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My App')),
            body: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.green[200],
                        child: Consumer<MyModel>( //          <--- MyModel Consumer
                          builder: (context, myModel, child) {
                            return RaisedButton(
                              child: Text('Do something'),
                              onPressed: (){
                                myModel.doSomething('Goodbye');
                              },
                            );
                          },
                        )
                    ),

                    Container(
                      padding: const EdgeInsets.all(35),
                      color: Colors.blue[200],
                      child: Consumer<MyModel>( //            <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return Text(myModel.someValue);
                        },
                      ),
                    ),

                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red[200],
                    child: Consumer<AnotherModel>( //          <--- AnotherModel Consumer
                      builder: (context, anotherModel, child) {
                        return RaisedButton(
                          child: Text('Do something else'),
                          onPressed: (){
                            anotherModel.doSomethingElse();
                          },
                        );
                      },
                    )
                )
              ],
            )),
      ),
    );
    /* return FutureProvider<MyModel>( //                      <--- FutureProvider
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );*/
    /*  return ChangeNotifierProvider(
      create: (context)=>MyModel(),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green[200],
              child: Consumer<MyModel>( //                  <--- Consumer
                builder: (context, myModel, child) {
                  return RaisedButton(
                    child: Text('Do something'),
                    onPressed: (){
                      myModel.doSomething();
                    },
                  );
                },
              )
          ),

          Container(
            padding: const EdgeInsets.all(35),
            color: Colors.blue[200],
            child: Consumer<MyModel>( //                    <--- Consumer
              builder: (context, myModel, child) {
                return Text(myModel.someValue);
              },
            ),
          ),
        ],
      ),
    );*/
  }
}

class MyModel with ChangeNotifier {
  //                       <--- MyModel
  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel {
  //                                      <--- AnotherModel
  MyModel _myModel;

  AnotherModel(this._myModel);

  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}

/*Future<MyModel> someAsyncFunctionToGetMyModel() async {
  //  <--- async function
  await Future.delayed(Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel {
  //                                               <--- MyModel
  MyModel({this.someValue});

  String someValue = 'Hello';

  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}*/
/*
class MyModel with ChangeNotifier { //                          <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}*/
