import 'package:encomme_shop/models/Product_accessoris_list.dart';
import 'package:flutter/material.dart';

import '../Detials_product_accessores_screen.dart';

class ProductAccessorCard extends StatefulWidget {
  final ProductAccessoriseList? productAccessoriseList;

  const ProductAccessorCard({Key ?key, this.productAccessoriseList}) : super(key: key);

  @override
  _ProductAccessorCardState createState() => _ProductAccessorCardState();
}

class _ProductAccessorCardState extends State<ProductAccessorCard> {
  bool? isPressed2 ;
  bool? isHighlighted ;
  bool? isFavorate;
  @override
  void initState() {
    isPressed2 = true;
     isHighlighted = true;
     isFavorate=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Stack(
        children: [
          Container(
            height: 240,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsProductAccessoriesScreens(productAccessoriseList: widget.productAccessoriseList!,Isfivorate: isFavorate!,)));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(widget.productAccessoriseList!.imagAcc!),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productAccessoriseList!.nameAcc!,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 15,),
                        Text("\$ ${widget.productAccessoriseList!.priceAcc}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18),),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 3,
            right: 7,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isHighlighted = !isHighlighted!;
                });
              },
              onTap: () {
                setState(() {
                  isPressed2 = !isPressed2!;
                  isFavorate=isPressed2;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.all(isHighlighted! ? 0 : 2.5),
                height: isHighlighted! ? 40 : 35,
                width: isHighlighted! ? 40 : 35,
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
                child: isPressed2!
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
