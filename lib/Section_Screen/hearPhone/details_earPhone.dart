import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_headphone_list.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';

import 'component/bodyEar_details.dart';

class DetailsHeadPhone extends StatelessWidget {
  final ProductHeadPhoneList? productHeadPhoneList;
  final ProductHeadPhoneForYouList productHeadPhoneForYouList;
  final bool? isforyou;

  const DetailsHeadPhone(
      {Key ?key, this.productHeadPhoneList,required this.productHeadPhoneForYouList, this.isforyou})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(cartStorList: CartStorList(imagcart:isforyou!? productHeadPhoneForYouList!.imagHP:productHeadPhoneList!.imagHP,
                titalcart:isforyou!? productHeadPhoneForYouList!.nameHP:productHeadPhoneList!.nameHP,

                price: isforyou!? productHeadPhoneForYouList!.priceHP:productHeadPhoneList!.priceHP,
                numproduct: 1),),
            SizedBox(width: 15,),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackPop(),
        title: Text(
          "H P",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
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
      body: bodyEarphoneDetails(
        productHeadPhoneForYouList: productHeadPhoneForYouList,
        productHeadPhoneList: productHeadPhoneList!,
        isforyou: isforyou!,),
    );
  }
}


