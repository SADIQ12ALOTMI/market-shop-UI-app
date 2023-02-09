import 'package:animations/animations.dart';
import 'package:encomme_shop/Section_Screen/hearPhone/component/productEar_phone.dart';
import 'package:encomme_shop/Section_Screen/hearPhone/component/special_for_you_card.dart';
import 'package:encomme_shop/models/product_headphone_list.dart';
import 'package:flutter/material.dart';

import 'CardNewProduct.dart';
import 'Screen_special_for_you.dart';
class bodyEarphone extends StatefulWidget {
  const bodyEarphone({
    Key ?key,
  }) : super(key: key);

  @override
  _bodyEarphoneState createState() => _bodyEarphoneState();
}

class _bodyEarphoneState extends State<bodyEarphone> {
 late List<ProductHeadPhoneList>productHeadPhoneList;
late  List<ProductHeadPhoneForYouList>productHeadPhoneForYouList;
  @override
  void initState() {
    productHeadPhoneList=ProductHeadPhoneList.productHeadPhoneList;
    productHeadPhoneForYouList=ProductHeadPhoneForYouList.productHeadPhoneForYouList;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                color: Colors.red[100],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CardNewProductHeadPhone(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Our Product:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.filter_list_rounded),
                            onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        itemCount: productHeadPhoneList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductEarPhoneCard(productHeadPhoneList: productHeadPhoneList[index], productHeadPhoneForYouList: productHeadPhoneForYouList[index],),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 160,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
              )),
          child: Padding(
            padding:
            EdgeInsets.only(top: 15, bottom: 10, right: 40, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spacial for you",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    OpenContainer(
                        closedBuilder: (_, openContainer) {
                          return GestureDetector(
                            onTap: openContainer,
                            child: Text(
                              "See All",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        },
                        openColor: Colors.white,
                        closedElevation: 50.0,
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        openBuilder: (_, closeContainer) {
                          return ScreenSpecialForYouHeadPhone();
                        })
                  ],
                ),
                SpacialForYouCardHeadPhone(ispress: false,productHeadPhoneForYouList: productHeadPhoneForYouList[2],)
              ],
            ),
          ),
        )
      ],
    );
  }
}