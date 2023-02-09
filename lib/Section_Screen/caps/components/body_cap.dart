import 'package:encomme_shop/models/product_cap_list.dart';
import 'package:flutter/material.dart';

import 'Product_Cap_Card.dart';
class bodyCap extends StatefulWidget {
  const bodyCap({
    Key ?key,
  }) : super(key: key);

  @override
  _bodyCapState createState() => _bodyCapState();
}

class _bodyCapState extends State<bodyCap> {
 late List<ProductCapList>productCapList;
  @override
  void initState() {
    productCapList=ProductCapList.productCapList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 150,
      ),
      Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
            ),
            itemCount: productCapList.length,
            itemBuilder: (context,index)=>ProductCapCard(productCapList:productCapList[index],)),
      )
    ],);
  }
}
