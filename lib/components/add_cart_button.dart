

import 'package:animated_button/animated_button.dart';

import 'package:encomme_shop/models/Cart_list.dart';
import 'package:flutter/material.dart';
class AddToCart extends StatefulWidget {

final CartStorList cartStorList;

  const AddToCart({Key? key,required this.cartStorList}) : super(key: key);
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  @override
  Widget build(BuildContext context) {
    return  AnimatedButton(

      onPressed: () {
        setState(() {
          CartStorList.cartStorList.add(widget.cartStorList);
          
        });
      },
      child: Icon(Icons.add_shopping_cart),
      color: Colors.green,
      shadowDegree: ShadowDegree.dark,
      height: 50,
      width: 50,
    );
  }
}

