

import 'package:encomme_shop/models/productMen_clothes.dart';
import 'package:flutter/material.dart';

import '../screen_details_men_clothes.dart';
class ProductMMClothesCard extends StatelessWidget {
  const ProductMMClothesCard({
    Key ?key, required this.productMMCList,
  }) : super(key: key);
  final ProductMMCList productMMCList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
     // ignore: deprecated_member_use
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 160,
             height: 340,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Colors.black26),
                  BoxShadow(
                      offset: Offset(5, 0),
                      blurRadius: 10,
                      // spreadRadius: 2,
                      color: Colors.black26),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsProductMenClothes(productMMCList: productMMCList,)));},
                  child: Hero(
                    tag: productMMCList.productMMC!,
                    child: Image(

                        image: AssetImage(
                            productMMCList.productMMC![0].imag!)
                    ,height: 150,),
                  ),
                ),
                Text(
                  productMMCList.productMMC![0].tital!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "\$ ${productMMCList.productMMC![0].price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red[400]),
                ),
                Row(
                  children: [
                    Text(
                      "2345 Sales",
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22,
                        ),
                        Text(
                          "3.5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: 2,
              bottom: 0,
              top: 0,
              child: ClikFavorateIcon(size: 45.0,))
        ],
      ),
    );
  }
}

class ClikFavorateIcon extends StatefulWidget {
  const ClikFavorateIcon({
    Key ?key, this.size,
  }) : super(key: key);

  final double? size;

  @override
  _ClikFavorateIconState createState() => _ClikFavorateIconState();
}

class _ClikFavorateIconState extends State<ClikFavorateIcon> {
  bool Isfavorate=false;
  @override
  Widget build(BuildContext context) {
    return Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        offset: Offset(5,-5),
        color: Colors.red[50]!.withOpacity(.5),
        blurRadius: 10
      ),
      BoxShadow(
        offset: Offset(-5,5),
        color: Colors.red[50]!.withOpacity(.5),
        blurRadius: 10
      ),
    ]
            ),
      child: IconButton(icon: Isfavorate?
      Icon(Icons.favorite_outlined,color:Colors.pink,):
      Icon(Icons.favorite_border_outlined,),
        onPressed: (){
        setState(() {
          Isfavorate=!Isfavorate;
        });
        },),
          );
  }
}