
import 'package:encomme_shop/Section_Screen/hearPhone/details_earPhone.dart';
import 'package:encomme_shop/models/product_headphone_list.dart';
import 'package:flutter/material.dart';
class SpacialForYouCardHeadPhone extends StatelessWidget {

final bool ispress;
final ProductHeadPhoneForYouList productHeadPhoneForYouList;

  const SpacialForYouCardHeadPhone({Key ?key, this.ispress=true,required this.productHeadPhoneForYouList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(ispress)
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsHeadPhone(productHeadPhoneForYouList: productHeadPhoneForYouList,isforyou: true,)));
      },

      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                      height: 90,
                      width: 80,
                      child: Hero(
                        tag: productHeadPhoneForYouList,
                        child: Image.asset(
                          productHeadPhoneForYouList.imagHP,
                          height: 55,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productHeadPhoneForYouList.nameHP,
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "\$ ${productHeadPhoneForYouList.priceHP}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                  )),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
