import 'dart:async';

import 'package:encomme_shop/models/product_bag_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_bags.dart';

class body extends StatefulWidget {
  const body({
    Key ?key,
  }) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
late  List<ProductBagList>productBagList;
  PageController pageController = PageController(initialPage: 1);
  Timer ?_timer;
  List<String> ImageBag = [
    "assets/images/splash/bag1.png",
    "assets/images/bags/bag_1.png",
    "assets/images/bags/bag_2.png",
    "assets/images/bags/bag_3.png",
    "assets/images/bags/bag_4.png",
    "assets/images/bags/bag_5.png",
  ];

  int currentBag = 0;

  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      pageController.animateToPage(currentBag + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  void initState() {
    productBagList=ProductBagList.productBagList;
    if (ImageBag.length > 0) {
      _setTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List AddImage = [];
    if (ImageBag.length > 0) {
      AddImage
        ..add(ImageBag[ImageBag.length - 1])
        ..addAll(ImageBag)
        ..add(ImageBag[0]);
    }
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 150,
              child: PageView.builder(
                  onPageChanged: (value){
setState(() {
  currentBag=value;
});
                  },
                  itemCount: 5,itemBuilder: (context,index)=>Image.asset("assets/images/bags/bag_6.png")),
            ),

            Positioned(
              left: 12,
              top: 8,
              child: buildDotScroll(),
            ),
          ],
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
          child: ListView.builder(
              itemCount: productBagList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => CardBags(productBagList: productBagList[index],)),
        ))
      ],
    );
  }

  RotatedBox buildDotScroll() {
    return RotatedBox(
              quarterTurns: 1,
              child: Row(
                children:
               [
                 ...List.generate(5, (index) => Padding(
                   padding: EdgeInsets.all(5),
                   child: Container(
                     height: 10,
                     width: 10,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.red.withOpacity(0.5)),
                         shape: BoxShape.circle),
                     child: Center(
                       child: AnimatedContainer(
                         duration: Duration(milliseconds: 300),
                         height: 6,
                         width: 6,
                         decoration: BoxDecoration(
                             color: currentBag == index+1 ? Colors.cyan : Colors.transparent,
                             shape: BoxShape.circle),
                       ),
                     ),
                   ),
                 ))
               ]

              ),
            );
  }


}
