import 'dart:ui';

import 'package:flutter/material.dart';
class bodySetting extends StatefulWidget {


  @override
  _bodySettingState createState() => _bodySettingState();
}

class _bodySettingState extends State<bodySetting>with TickerProviderStateMixin<bodySetting> {
late  ScrollController _scrollController;
late  double _offset;
late  bool isSrink;

  int currentbag = 0;

  bool iselectouroffers=false;
  int index_1 = 0;
 late AnimationController animationController;
 late Animation<double> animation1;
 late Animation<double> animation2;
 late Animation<double> animation3;
late  bool _bool;

  @override
  void initState() {
    // index_1=0;
    _bool = true;
    iselectouroffers = true;
    // currentbag=0;
    _scrollController = ScrollController();
    _offset = 0.0;
    isSrink = false;

    _scrollController.addListener(_scrollListener);



    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation1 = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    animation2 = Tween<double>(begin: 0, end: 3).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    animation3 = Tween<double>(begin: 9, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    animationController.dispose();
    super.dispose();
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.offset < 60) {
        _offset = _scrollController.offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              child: Image.asset("assets/images/backprofile1.jpg",fit: BoxFit.fill,),

            ),
            BackdropFilter(
              filter:
              ImageFilter.blur(sigmaY: 6, sigmaX: 6),
              child: Container(
                height:  _height,
                width:  _width,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    width: _width * 0.9,
                    height: _height * 1.3,
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent[100]!.withOpacity(.40),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          radius: 50,
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            MyTitelWithIcon(Icons.person_pin, "My Profile", () {}),
                            MyTitelWithIcon(
                                Icons.settings_outlined, "Setting", () {}),
                            MyTitelWithIcon(
                                Icons.info_outline_rounded, "About", () {}),
                            MyTitelWithIcon(
                                Icons.feedback_outlined, "FeedBack", () {}),
                            MyTitelWithIcon(
                                Icons.find_in_page_outlined, "Privacy Policy", () {}),
                          ],
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
  Widget MyTitelWithIcon(IconData icon, String title, VoidCallback press) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: press,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
