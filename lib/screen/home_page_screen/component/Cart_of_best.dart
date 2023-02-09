import 'package:encomme_shop/models/ouroffers_shop.dart';
import 'package:flutter/material.dart';

import '../../../constract.dart';





class CartOfBest1 extends StatefulWidget {

  final OurOffersProduct offersProduct;

  const CartOfBest1({Key ?key,required this.offersProduct}) : super(key: key);

  @override
  _CartOfBest1State createState() => _CartOfBest1State();
}

class _CartOfBest1State extends State<CartOfBest1> {
  bool isPressed2 = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [

          Container(
            height: 195,
 width: 160,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
Container(

    // padding: EdgeInsets.only(right: 20),

          height: 120,

          width: 140,

          decoration: BoxDecoration(

   color:Colors.cyan[50],

  borderRadius: BorderRadius.circular(20),

          ),

          child: Image.asset(widget.offersProduct.imag!),

    ),
                SizedBox(height: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(widget.offersProduct.type!),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(widget.offersProduct.name!,maxLines: 2,style: TextStyle(fontSize: 12),),
                        Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,8),
                                    blurRadius: 10,
                                    color: Colors.brown[200]!

                                )
                              ]
                          ),
                          child: Center(child: Text("\$${widget.offersProduct.price}")),
                        )
                      ],
                    ),
                  ],
                ),


              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child:InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isHighlighted = !isHighlighted;
                });
              },
              onTap: () {
                setState(() {
                  isPressed2 = !isPressed2;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
                height: isHighlighted ? 35 : 30,
                width: isHighlighted ? 35: 30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: Offset(5, 10),
                    ),
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: isPressed2
                    ? Icon(
                  Icons.favorite_border,
                  color: Colors.black.withOpacity(0.6),
                )
                    : Icon(
                  Icons.favorite,
                  color: Colors.pink.withOpacity(1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CartOfBest extends StatelessWidget {

  final OurOffersProduct offersProduct;
  const CartOfBest({
    Key? key,required this.offersProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return
      Stack(
// ignore: deprecated_member_use


        children: [
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            padding: EdgeInsets.all(10),

            width: 170,
            height: 180,
            decoration: BoxDecoration(
              color: zbackgroundcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.favorite_outline,size: 30,)),

                SizedBox(height: 80,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(offersProduct.name!)),
                SizedBox(height: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(offersProduct.type!,maxLines: 2,style: TextStyle(fontSize: 12),),
                        Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,8),
                                    blurRadius: 10,
                                    color: Colors.brown[200]!

                                )
                              ]
                          ),
                          child: Center(child: Text("\$${offersProduct.price}")),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(


            child: Image(
              image: AssetImage(offersProduct.imag!),height: 140,width: 160,
            ),
          )
        ],
      );
  }

}

