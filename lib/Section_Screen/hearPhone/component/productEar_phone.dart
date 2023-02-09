
import 'package:encomme_shop/models/product_headphone_list.dart';

import 'package:flutter/material.dart';

import '../details_earPhone.dart';
class ProductEarPhoneCard extends StatelessWidget {
  final ProductHeadPhoneList productHeadPhoneList;
  final ProductHeadPhoneForYouList productHeadPhoneForYouList;
  const ProductEarPhoneCard({Key ?key,required this.productHeadPhoneList, required this.productHeadPhoneForYouList}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsHeadPhone(productHeadPhoneList: productHeadPhoneList,isforyou: false, productHeadPhoneForYouList: productHeadPhoneForYouList,)));
            },
            child: Container(
              height: 190,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: productHeadPhoneList,
                      child: Image(
                        image: AssetImage(
                          productHeadPhoneList.imagHP,
                        ),
                        height: 130,
                      ),
                    ),
                    Text(
                      productHeadPhoneList.nameCompany,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("\$ ${productHeadPhoneList.priceHP}")
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(25),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                child: Icon(
                  Icons.add,
                  color: Colors.grey[200],
                ),
              ))
        ],
      ),
    );
  }
}