
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/screen/signin/signin_screen.dart';
import 'package:flutter/material.dart';

import 'context_splash.dart';

class body extends StatefulWidget {
  const body({
    Key ?key,
  }) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  int currentbag = 0;
  List<Map<String, String>> splashData = [
    {"text": "man's Clothing", "imag": "assets/images/splash/clothing1.png"},
    {"text": "woman's Clothing", "imag": "assets/images/splash/cloth2.png"},
    {"text": "Bags", "imag": "assets/images/splash/bag1.png"},
    {"text": "accessories", "imag": "assets/images/splash/ring_3.png"},
    {"text": "beauty tool", "imag": "assets/images/splash/beauty1111.png"},
    {"text": "watches", "imag": "assets/images/splash/wqtchsmart.jpeg"},
    {"text": "electronics", "imag": "assets/images/splash/electron.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Discover and shop".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentbag = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => ContextSplash(
                      text: splashData[index]["text"]!,
                      img: splashData[index]["imag"]!,
                    )),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefualtButton(
                    text: "Get Start",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    },
                  ),
                  Spacer()
                ]),
              ))
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentbag == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentbag == index ? Colors.redAccent : Color(0xFFDBDBDB),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
