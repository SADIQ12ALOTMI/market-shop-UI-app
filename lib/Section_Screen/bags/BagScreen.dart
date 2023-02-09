import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/constract.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/body_bags.dart';

class BagsScreen extends StatelessWidget {
  final SectionOffers sectionOffers;

  const BagsScreen({Key ?key,required this.sectionOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionOffers.name!),
        centerTitle: true,
        actions: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: IconWithBtnCounter(
              iconsvg: "assets/icons/CartIcon.svg",
              press: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartHomeScreen()));},
              numOfItem: CartStorList.cartStorList.length,
            ),
          ),
        ],
      ),
      backgroundColor: zbackgroundcolor,
      body: body(),
    );
  }
}




