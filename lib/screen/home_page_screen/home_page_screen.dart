import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:encomme_shop/constract.dart';
import 'package:encomme_shop/screen/Build_Body/Body_Setting.dart';

import 'package:encomme_shop/screen/Build_Body/body_SectionsScreen.dart';
import 'package:encomme_shop/screen/Build_Body/body_faviorate.dart';
import 'package:flutter/material.dart';


import 'component/body_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    {

  int currentbag = 0;
  int index1 = 0;

  bool iselectouroffers=false;
  int index_1 = 0;



  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(

      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BuildBottomBar(),
      body: BuidlBody(index1),
    );
  }

   BuidlBody(int index1) {
    switch (index1) {
      case 1:
        return SectionOffers();

      case 2:
        return bodySetting();
      case 0:
        return body_Home();

        default:body_Home();

    }
  }

  Widget BuildBottomBar() {
    return BottomNavyBar(
      backgroundColor: zbackgroundcolor,
      containerHeight: 45,
      itemCornerRadius: 20,
      animationDuration: Duration(milliseconds: 400),
      selectedIndex: index1,
      onItemSelected: (index) => setState(() => this.index1 = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            textAlign: TextAlign.center,
            activeColor: Colors.brown[300]!,
            inactiveColor: Colors.brown[700]),
        BottomNavyBarItem(
            icon: Icon(Icons.grid_view,color: Colors.brown,),

            title: Text("Sections"),
            textAlign: TextAlign.center,
            activeColor: Colors.brown[300]!,
            inactiveColor: Colors.brown[700]),
        // BottomNavyBarItem(
        //     icon: Icon(
        //       Icons.favorite_outlined,
        //       color: Colors.red,
        //     ),
        //     title: Text("Favirote"),
        //     textAlign: TextAlign.center,
        //     activeColor: Colors.brown[300],
        //     inactiveColor: Colors.brown[700]),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text("Setting"),
            textAlign: TextAlign.center,
            activeColor: Colors.brown[300]!,
            inactiveColor: Colors.brown[700]),
      ],
    );
  }
}
