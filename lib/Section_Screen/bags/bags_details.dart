import 'dart:math';

import 'package:encomme_shop/components/BuildContainer_with_icon.dart';
import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_bag_list.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BagsDetails extends StatelessWidget {
  final ProductBagList productBagList;

  const BagsDetails({Key? key,required this.productBagList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(cartStorList: CartStorList(imagcart: productBagList.imagbag,titalcart: productBagList.namebag,price: productBagList.pricebag,numproduct: 1),),
            SizedBox(width: 15,),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackPop(),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                         height: 180,
                        child: Hero(
                            tag: productBagList,
                            child: Image.asset(productBagList.imagbag!))),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2 + 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 22, right: 20, bottom: 10, top: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              productBagList.namebag!,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$ ${productBagList.pricebag}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.blue[700]),
                            ),
                            Row(
                              children: [
                                Text(
                                  " ${4.5}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 24,
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Colors :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  4,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.brown, width: 1)),
                                        ),
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          bottom: 5,
                                          left: 5,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(productBagList.subtitalbag!),


                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 50,
              top: 170,
              child: BuildContainerWithIcon(),
            )
          ],
        ),
      ),
    );
  }
}
