import 'package:encomme_shop/screen/home_page_screen/component/SectionCardIndexPress.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class SectionOffers extends StatefulWidget {
  @override
  _SectionOffersState createState() => _SectionOffersState();
}

class _SectionOffersState extends State<SectionOffers> {
  PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;

  List<String> _images = [

    'assets/images/bags/bag_6.png',
    'assets/images/caps/cap_8.png',
    'assets/images/hearphone/headphones_3.png',

    'assets/images/accessories/ring_6.png',
    'assets/images/watches/smartwatch16.png',

    'assets/images/section_ourOffers/girlClo1.png',
    'assets/images/womenClo/WMdressTab/wmdressRm1_9.png',
    'assets/images/section_ourOffers/MenClo1.png'

  ];
  Timer? _timer;

  @override
  void initState() {
    print(_images.asMap());
    if (_images.length > 0) {
      _setTimer();
    }
    super.initState();
  }

  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
  @override
  void dispose()
  {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List addedImages = [];
    if (_images.length > 0) {
      addedImages
        ..add(_images[_images.length - 1])
        ..addAll(_images)
        ..add(_images[0]);
    }
    return SingleChildScrollView(

      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown[50],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
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
                      child: _images.length > 0
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
                      bottom: 15,
                      left: 15,
                      top: 15,

                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _images
                              .asMap()
                              .map((i, v) => MapEntry(
                              i,
                              Container(
                                width: 6,
                                height: 6,
                                margin: EdgeInsets.only(left: 2, right: 2),
                                decoration: ShapeDecoration(
                                  color: _currentIndex == i + 1 ? Colors.red : Colors.white,
                                  shape: CircleBorder(),
                                ),
                              )))
                              .values
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(
                height: 10,
              ),
         Expanded(child: SectionCardIndexPress())


              // Expanded(child: SectionCardIndexPress())
            ],
          ),
        ),
      ),
    );
  }
}




