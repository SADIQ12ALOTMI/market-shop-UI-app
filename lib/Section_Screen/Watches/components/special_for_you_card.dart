import 'package:encomme_shop/Section_Screen/Watches/DetailsSmartWatch.dart';
import 'package:encomme_shop/models/product_watch_list.dart';
import 'package:flutter/material.dart';
class SpacialForYouCard extends StatelessWidget {

final bool ispress;
final ProductWatchForYouList productWatchForYouList;

  const SpacialForYouCard({Key ?key, this.ispress=true,required this.productWatchForYouList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(ispress)
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsSmartWatch(productWatchForYouList: productWatchForYouList,isforyou: true,)));
      },

      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white30,
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
                        tag: productWatchForYouList,
                        child: Image.asset(
                          productWatchForYouList.imagWch,
                          height: 55,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productWatchForYouList.nameWch,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "\$ ${productWatchForYouList.price}",
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                  )),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
