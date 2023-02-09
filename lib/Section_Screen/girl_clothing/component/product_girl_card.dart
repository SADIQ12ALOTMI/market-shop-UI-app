import 'package:encomme_shop/components/build_likeButton.dart';
import 'package:encomme_shop/components/build_likebutton_with_counter.dart';
import 'package:encomme_shop/models/product_girl_clothes.dart';
import 'package:flutter/material.dart';

import '../details_product_girl_clothes.dart';

class ProductGirlCard extends StatelessWidget {
 final ProductGirlCList productGirlCList;

  const ProductGirlCard({Key ?key, required this.productGirlCList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(


        padding: EdgeInsets.only(left: 15,bottom: 10,),
        height: 250,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.blue[50]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsGrilClothes(productGirlCList: productGirlCList,)));},
                child: Hero(
                    tag: productGirlCList,
                    child: Image.asset(productGirlCList.productGirlC[0].imag!,height: 170,))),
            Text(productGirlCList.productGirlC[0].tital!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  BuildLikeIcon(iconData: Icons.thumb_up_outlined,),
                  BuildLikeIconWithCounter(iconData: Icons.favorite,)
                ]),
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
              ),child: Center(child: Text("\$ ${productGirlCList.productGirlC[0].price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            ),
          ],
        ),
      ),
    );
  }
}