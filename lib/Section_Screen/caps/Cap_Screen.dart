import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';

import 'package:flutter/material.dart';


import 'components/body_cap.dart';
class CapScreen extends StatelessWidget {

final SectionOffers sectionOffers;


  const CapScreen({Key ?key,required this.sectionOffers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackPop(),
        title: Text(sectionOffers.name!.toUpperCase()),
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
      body: bodyCap(),
    );
  }
}

