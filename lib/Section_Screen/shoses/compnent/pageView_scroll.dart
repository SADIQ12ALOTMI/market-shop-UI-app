import 'dart:async';

import 'package:flutter/material.dart';
class PagViewShose extends StatefulWidget {


  @override
  _PagViewShoseState createState() => _PagViewShoseState();
}

class _PagViewShoseState extends State<PagViewShose> {
  PageController _pageController=PageController(initialPage: 1);
  int _currentIndex=1;
  Timer? _timer;
  List<String> _Image=[

    "assets/images/shoseKK/BootsMMM_13.webp",
    "assets/images/shoseKK/BootsMMM_4.webp",
    "assets/images/shoseKK/BootsWMW_4.webp",
    "assets/images/shoseKK/BootsWMW.webp",
    "assets/images/shoseKK/HeelWM_4.webp",
    "assets/images/shoseKK/BootsHWM.webp",
    "assets/images/shoseKK/HeelWM_3.webp",
    "assets/images/shoseKK/BootsHM_3.webp",
    "assets/images/shoseKK/KidsGB_2.webp",
    "assets/images/shoseKK/KidsGB_10.webp",
    "assets/images/shoseKK/boyBBB_2.webp",
    "assets/images/shoseKK/boyBBB_8.webp",
  ];
  @override
  void initState() {
    print(_Image.asMap());
    if (_Image.length > 0) {
      _setTimer();
    }
    super.initState();
  }

  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    List addedImages = [];
    if (_Image.length > 0) {
      addedImages
        ..add(_Image[_Image.length - 1])
        ..addAll(_Image)
        ..add(_Image[0]);
    }
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 200,
          width: double.infinity,
        ),
        Container(

          height: 200,
          width: double.infinity,
          child: Stack(
            children: [
              NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification.depth == 0 && notification is ScrollStartNotification) {
                    if (notification.dragDetails != null) {
                      _timer!.cancel();
                    }
                  } else if (notification is ScrollEndNotification) {
                    _timer!.cancel();
                    _setTimer();
                  }
                  return true;
                },
                child: _Image.length > 0
                    ? PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    int newIndex;
                    if (page == addedImages.length - 1) {
                      newIndex = 1;
                      _pageController.jumpToPage(newIndex);
                    } else if (page == 0) {
                      newIndex = addedImages.length - 2;
                      _pageController.jumpToPage(newIndex);
                    } else {
                      newIndex = page;
                    }
                    setState(() {
                      _currentIndex = newIndex;
                    });
                  },
                  children: addedImages
                      .map((item) => Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        item,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ))
                      .toList(),
                )
                    : Container(),
              ),
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _Image
                      .asMap()
                      .map((i, v) => MapEntry(
                      i,
                      Container(
                        width: _currentIndex==i+1?15:6,
                        height: 6,
                        margin: EdgeInsets.only(left: 4, ),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(4),
                          color: _currentIndex == i + 1 ? Colors.red : Colors.black,


                        ),
                      )))
                      .values
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  @override
  void dispose()
  {
    _timer?.cancel();
    super.dispose();
  }
}

