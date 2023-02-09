import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/ListShose.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';


import 'compnent/curves_backround_shose.dart';

class DetailsShoseScreen extends StatefulWidget {
  final ProductShoseList productShoseList;

  const DetailsShoseScreen({Key? key,required this.productShoseList}) : super(key: key);

  @override
  _DetailsShoseScreenState createState() => _DetailsShoseScreenState();
}

class _DetailsShoseScreenState extends State<DetailsShoseScreen> {
  int selectindeximage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10,),
        height: 65,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Colors.blueGrey[50],
          boxShadow: [
            BoxShadow(offset: Offset(3,0),
                color: Colors.black26,
                blurRadius: 10
            )
          ],
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),
        child: Row(
          children: [
            AddToCart(
              cartStorList: CartStorList(
                  imagcart: widget.productShoseList.image![selectindeximage],
                  titalcart: widget.productShoseList.tital![selectindeximage],
                  price: widget.productShoseList.price,
                  numproduct: widget.productShoseList.subimg!.length),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Details".toUpperCase()),
        centerTitle: true,
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
          ClipCurveBackDSW(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image(
                        image: AssetImage(
                            widget.productShoseList.subimg![selectindeximage]))),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(widget.productShoseList.subimg!.length,
                            (index) => buildSelectImags(index))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productShoseList.subtital!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "\$ " + widget.productShoseList.price.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "OverView :\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18)),
                  TextSpan(
                      text:
                          "Shoes. When your wardrobe feels lackluster, there's no need to buy an entirely new outfit—all you need is a new pair of shoes. A dash of color, a few extra inches or a casual and relaxed look is easy to attain",
                      style: TextStyle(color: Colors.black87)),
                ])),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Size :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "Size Chart",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white70,
                              ),
                              child: Center(
                                  child: Container(
                                height: 2,
                                color: Colors.brown[200],
                              )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                "7",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                "8",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white70,
                              ),
                              child: Center(
                                  child: Container(
                                height: 2,
                                color: Colors.brown[200],
                              )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                "9",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: Center(
                                  child: Text(
                                "10",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              left: 20,
              top: 8,
              child: Text(
                widget.productShoseList.tital!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
    );
  }

  GestureDetector buildSelectImags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectindeximage = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: selectindeximage == index
                      ? Colors.red
                      : Colors.transparent)),
          child: Center(
              child: Image.asset(
            widget.productShoseList.subimg![index],
            fit: BoxFit.fill,
          )),
        ),
      ),
    );
  }
}
