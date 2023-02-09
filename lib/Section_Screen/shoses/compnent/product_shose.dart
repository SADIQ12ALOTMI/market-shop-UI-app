import 'package:encomme_shop/Section_Screen/shoses/details_shose.dart';
import 'package:encomme_shop/models/ListShose.dart';
import 'package:flutter/material.dart';
class ProductShose extends StatelessWidget {
  const ProductShose({
    Key ?key,required this.productShoseList, this.press,
  }) : super(key: key);
  final ProductShoseList productShoseList;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10,
                right: 10),
            height: 280,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      productShoseList.tital!,
                      style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                        productShoseList.subtital!),
                  ],
                ),
                InkWell(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsShoseScreen(productShoseList: productShoseList,)));},
                  child: Image.asset(
                      productShoseList.image!),
                ),
                Text(
                  "\$ ${productShoseList.price}",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(

                      bottomRight:Radius.circular(20),

                      topLeft:Radius.circular(10),
                    )),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ))
        ],
      ),
    );
  }
}