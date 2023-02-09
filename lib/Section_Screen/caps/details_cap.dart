
import 'dart:math';

import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_cap_list.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
class CapDetails extends StatefulWidget {
  final ProductCapList productCapList;
  final bool? Isfivorate;

  const CapDetails({Key ?key,required this.productCapList, this.Isfivorate}) : super(key: key);
  @override
  _CapDetailsState createState() => _CapDetailsState();
}

class _CapDetailsState extends State<CapDetails> {
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
            AddToCart(cartStorList: CartStorList(imagcart:widget.productCapList.imgcp ,titalcart:widget.productCapList.namecp ,price: widget.productCapList.price,numproduct: 1),),
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
      body: Stack(
        children: [
          Column(
            children: [
              Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(widget.productCapList.imgcp!)),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
              Expanded(

                child: Container(
                  width: double.infinity,

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
                              widget.productCapList.namecp!,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$ ${widget.productCapList.price}",
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
                        Text(
                            "Join Nordstrom Fashion Editor Kate Bellman every other Friday for the latest fashion. Kate will share her tips for curating the season's best styles from the brands you love. "),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 50,
            top: 170,
            child:  Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
    boxShadow: [
    BoxShadow(
    offset: Offset(0,6),
    color: Colors.black38,
    blurRadius: 10
    )
    ]
    ),
    child: IconButton(icon: Icon(Icons.favorite_outlined,size: 35,color:widget.Isfivorate!? Colors.white:Colors.red), onPressed: () {  },),
    )),

        ],
      ),
    );
  }
}