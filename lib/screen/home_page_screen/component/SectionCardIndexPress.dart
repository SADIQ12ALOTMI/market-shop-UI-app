import 'package:encomme_shop/Section_Screen/Accessorise/Accessoris_Screen.dart';
import 'package:encomme_shop/Section_Screen/Men_Clothings/MenCloth_Screen.dart';
import 'package:encomme_shop/Section_Screen/Watches/watches_Screen.dart';
import 'package:encomme_shop/Section_Screen/Women_Clothings/women_clothing_home.dart';
import 'package:encomme_shop/Section_Screen/bags/BagScreen.dart';

import 'package:encomme_shop/Section_Screen/caps/Cap_Screen.dart';

import 'package:encomme_shop/Section_Screen/girl_clothing/girl_Clothing.dart';

import 'package:encomme_shop/Section_Screen/hearPhone/hearPhone_screen.dart';
import 'package:encomme_shop/Section_Screen/shoses/shoseScreen.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/screen/home_page_screen/component/sectionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SectionCardIndexPress extends StatefulWidget {


  @override
  _SectionCardIndexPressState createState() => _SectionCardIndexPressState();
}

class _SectionCardIndexPressState extends State<SectionCardIndexPress> {
 late List<SectionOffers> sectionOffers;

  @override
  void initState() {
    sectionOffers = SectionOffers.sectionOffers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12),
        child: GridView.builder(
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: sectionOffers.length,
          itemBuilder: (context, index) =>
              AnimationConfiguration.staggeredGrid(position: index,
                  columnCount: 6,
                  duration: Duration(milliseconds: 500),
                  child: ScaleAnimation(duration: Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,child: FadeInAnimation(child: SectionCard(imag:sectionOffers[index].imag!,
                      name: sectionOffers[index].name!, press: () {
                        switch (index) {
                          case 0:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    BagsScreen(sectionOffers: sectionOffers[index],)));

                          case 1:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CapScreen(sectionOffers: sectionOffers[index])));
                          case 2:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    HearPhoneScreen(sectionOffers: sectionOffers[index])));

                          case 3:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AccessoriseScreen(sectionOffers: sectionOffers[index])));
                          case 4:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    WatchesScreen(sectionOffers: sectionOffers[index])));
                          case 5:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ShoseScreen(sectionOffers: sectionOffers[index])));

                          case 6:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    GirlCloScreen(sectionOffers: sectionOffers[index])));
                          case 7:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    MenCloScreen(sectionOffers: sectionOffers[index])));
                          case 8:
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    WomenClothingHome(sectionOffers: sectionOffers[index])));
                        }
                      },),),))
          ),);
  }
}