import 'package:encomme_shop/models/Cart_list.dart';
import 'package:flutter/material.dart';
class CartItemCard extends StatelessWidget {
  final CartStorList cartStorList;
  const CartItemCard({
    Key ?key,required this.cartStorList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.cyanAccent[100]
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(cartStorList.imagcart!),

              ),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:

            [
              Text(cartStorList.titalcart!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text( "\$${cartStorList.price}   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent,fontSize: 20)),
                  Text( " N P -> ${cartStorList.numproduct}   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 16)),

                ],
              )
            ],)
        ],
      ),
    );
  }
}