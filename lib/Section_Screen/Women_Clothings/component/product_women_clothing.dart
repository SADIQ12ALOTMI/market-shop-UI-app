import 'package:encomme_shop/components/build_likeButton.dart';
import 'package:encomme_shop/components/build_likebutton_with_counter.dart';
import 'package:encomme_shop/models/product_WM_clo.dart';
import 'package:flutter/material.dart';

import '../details_product_women_clothing.dart';
class ProductWomenClothing extends StatelessWidget {
  const ProductWomenClothing({
    Key ?key,required this.productCWMList,
  }) : super(key: key);
  final ProductCWMList productCWMList;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(


        padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
        height: 350,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.blue[50]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsProductWomenClothing(productCWMList: productCWMList,)));},
                child: Hero(
                    tag: productCWMList,
                    child: Image.asset(productCWMList.productWMC![0].imag!,height: 250,))),
            Text(productCWMList.productWMC![0].tital!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,1),
                              blurRadius: 1
                          )
                        ]
                    ),child: Center(child: Text("\$ ${productCWMList.productWMC![0].price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                  ),
                  BuildLikeIcon(iconData: Icons.thumb_up_outlined,),
                  BuildLikeIconWithCounter(iconData: Icons.favorite,)
                ])
          ],
        ),
      ),
    );
  }
}

