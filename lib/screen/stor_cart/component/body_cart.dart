import 'package:encomme_shop/models/Cart_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_item_card.dart';
class BodyCart extends StatefulWidget {


  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
 late List<CartStorList>cartStorList;
  @override
  void initState() {
   cartStorList=CartStorList.cartStorList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartStorList.length,
      itemBuilder: (context,index)=>Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
key:Key(cartStorList[index].toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction){
  cartStorList.removeAt(index);
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0XFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg")

                ],
              ),
            ),

            child: CartItemCard(cartStorList: cartStorList[index],)),
      ),

    );
  }
}


