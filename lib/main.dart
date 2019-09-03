import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '点击位置'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _globlePositionX = 0.0; //点击位置的横坐标
  double _globlePositionY = 0.0; //点击位置的纵坐标

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
              height: 100,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onPanDown: (DragDownDetails details) {
                        _globlePositionX = details.globalPosition.dx;
                        _globlePositionY = details.globalPosition.dy;
                      },
                      onLongPress: () {
                        _showPromptBox();
                      },
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child:
                    GestureDetector(
                      onPanDown: (DragDownDetails details) {
                        _globlePositionX = details.globalPosition.dx;
                        _globlePositionY = details.globalPosition.dy;
                      },
                      onLongPress: () {
                        _showPromptBox();
                      },
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /*显示长按出来的提示框*/
  void _showPromptBox() {
    bool isLeft = false; //点击的是左侧的item吗
    bool isTop = false; //点击的位置在上半屏幕吗
    String imgStr = "";

    /*确定点击位置在左侧还是右侧*/
    if (_globlePositionX > MediaQuery.of(context).size.width / 2) {
      isLeft = false;
    } else {
      isLeft = true;
    }

    /*确定点击位置在上半屏幕还是下半屏幕*/
    if (_globlePositionY > MediaQuery.of(context).size.height / 2) {
      isTop = false;
    } else {
      isTop = true;
    }

    /*根据位置判断显示哪一个带箭头的图片*/
    if (isTop == true && isLeft == true) {
      //左上
      imgStr = "images/bgLeftTop.png";
    } else if (isTop == true && isLeft == false) {
      //右上
      imgStr = "images/bgRightTop.png";
    } else if (isTop == false && isLeft == true) {
      //左下
      imgStr = "images/bgLeftBottom.png";
    } else if (isTop == false && isLeft == false) {
      //右下
      imgStr = "images/bgRightBottom.png";
    }

    showDialog(
        context: context,
        builder: (ctx) {
          return Stack(
            children: <Widget>[
              Container(),
              Positioned(
                top: isTop ? _globlePositionY : _globlePositionY - 200,
                left: 30,
                right: 30,
                child: Container(
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        imgStr,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        child: Container(), //放提示框上的按钮们
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
