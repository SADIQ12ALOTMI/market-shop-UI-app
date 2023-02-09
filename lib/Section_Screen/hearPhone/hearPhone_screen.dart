import 'package:animations/animations.dart';
import 'package:encomme_shop/Section_Screen/hearPhone/component/CardNewProduct.dart';
import 'package:encomme_shop/Section_Screen/hearPhone/component/productEar_phone.dart';
import 'package:encomme_shop/Section_Screen/hearPhone/component/special_for_you_card.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/Screen_special_for_you.dart';
import 'component/body_earphone.dart';

class HearPhoneScreen extends StatelessWidget {
  final SectionOffers sectionOffers;

  const HearPhoneScreen({Key ?key,required this.sectionOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
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
        title: Text(sectionOffers.name!),
        centerTitle: true,
      ),
      body: bodyEarphone(),
    );
  }
}


