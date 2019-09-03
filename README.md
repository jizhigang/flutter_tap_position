# flutter_tap_position
获取点击位置的demo

我们在使用快手或者京东时经常可以看到这么一个功能，长按一个作品然后弹出来一个弹框，这个弹框有一个小箭头指向这个作品，碰巧我们也需要一个这样的功能，于是做此分享与君共勉。

![jd.jpg](https://upload-images.jianshu.io/upload_images/3305752-43f5c1abb7451651.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

要想实现长按弹出弹框功能需要获取长按的globalPosition全局位置，实现起来很简单
```
                    GestureDetector(
                      onPanDown: (DragDownDetails details) {
                        double globlePositionX = details.globalPosition.dx;
                        double globlePositionY = details.globalPosition.dy;
                      },
                      onLongPress: () {
                        //根据globlePositionX和globlePositionY弹出弹框
                      },
                      child: Container(),
                    ),
```

`onLongPress `方法是获取不了位置的，需要借助`onPanDown `方法

实现效果

![display01.jpg](https://upload-images.jianshu.io/upload_images/3305752-9fb1e8d8830e6cb4.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![display02.jpg](https://upload-images.jianshu.io/upload_images/3305752-e157f619a9d6cb84.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![display03.jpg](https://upload-images.jianshu.io/upload_images/3305752-c0ff488dd0248ab7.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
