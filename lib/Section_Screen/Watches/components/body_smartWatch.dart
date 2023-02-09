import 'package:animations/animations.dart';
import 'package:encomme_shop/Section_Screen/Watches/components/productListWatches.dart';
import 'package:encomme_shop/Section_Screen/Watches/components/special_for_you_card.dart';
import 'package:encomme_shop/models/product_watch_list.dart';
import 'package:flutter/material.dart';

import 'CardNewProduct.dart';
import 'Screen_special_for_you.dart';
class bodyWatches extends StatefulWidget {


  @override
  _bodyWatchesState createState() => _bodyWatchesState();
}

class _bodyWatchesState extends State<bodyWatches> {
 late List<ProductWatchList>productWatchList;
 late List<ProductWatchForYouList>productWatchForYouList;
  @override
  void initState() {
    productWatchList=ProductWatchList.productWatchList;
    productWatchForYouList=ProductWatchForYouList.productWatchForYouList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.black,
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
                      CardNewProductWatch(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Our Product",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.filter_list_rounded,
                                color: Colors.black,
                                size: 22,
                              ),
                              onPressed: () {})
                        ],
                      ),
                      SizedBox(
                          height: 190,
                          child: ListView.builder(
                              itemCount: productWatchList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  ProductSmartWatch(productWatchList: productWatchList[index],))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                BorderRadius.only(topRight: Radius.circular(70))),
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
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      OpenContainer(closedBuilder: (_, openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Text(
                            "See All",
                            style: TextStyle(color: Colors.red),
                          ),
                        );

                      },
                          openColor: Colors.white,
                          closedElevation: 50.0,
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          openBuilder: (_, closeContainer) {
                            return ScreenSpecialForYou();
                          })
                    ],
                  ),
                  SpacialForYouCard(ispress: false,productWatchForYouList:productWatchForYouList[1],)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}