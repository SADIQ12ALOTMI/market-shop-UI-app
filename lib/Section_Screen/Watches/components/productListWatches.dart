import 'package:encomme_shop/Section_Screen/Watches/DetailsSmartWatch.dart';
import 'package:encomme_shop/models/product_watch_list.dart';
import 'package:flutter/material.dart';
class ProductSmartWatch extends StatelessWidget {
  final ProductWatchList productWatchList;


  const ProductSmartWatch({Key ?key,required this.productWatchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsSmartWatch(productWatchList: productWatchList,isforyou: false,)));
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
                      tag: productWatchList,
                      child: Image(
                        image: AssetImage(
                          productWatchList.imagWch,
                        ),
                        height: 130,
                      ),
                    ),
                    Text(
                      productWatchList.nameWch,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("\$ ${productWatchList.price}")
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