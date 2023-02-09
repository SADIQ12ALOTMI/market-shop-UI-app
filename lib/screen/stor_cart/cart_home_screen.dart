import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:flutter/material.dart';

import 'component/body_cart.dart';
class CartHomeScreen extends StatefulWidget {


  @override
  _CartHomeScreenState createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {
 late List<CartStorList>cartStorList;
  @override
  void initState() {
    cartStorList=CartStorList.cartStorList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[50],
        leading: BackPop(),
        title: Text("Stor Cart".toUpperCase(),style: TextStyle(fontSize: 17),),
        centerTitle: true,
        actions: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text("${cartStorList.length}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),
            ),
          )
        ],
      ),
      body: BodyCart(),
    );
  }
}
