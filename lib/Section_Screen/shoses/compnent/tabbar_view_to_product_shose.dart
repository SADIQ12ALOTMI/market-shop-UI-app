import 'package:encomme_shop/Section_Screen/shoses/compnent/product_shose.dart';
import 'package:encomme_shop/models/ListShose.dart';
import 'package:flutter/material.dart';
class TabBarViewToProductShose extends StatefulWidget {
  const TabBarViewToProductShose({
    Key? key,
  }) : super(key: key);

  @override
  _TabBarViewToProductShoseState createState() => _TabBarViewToProductShoseState();
}

class _TabBarViewToProductShoseState extends State<TabBarViewToProductShose> {
 late List<ProductShoseList> productShoseList;
  @override
  void initState() {
    productShoseList=ProductShoseList.productshoseMen;
    productShoseList=ProductShoseList.productshosewomen;
    productShoseList=ProductShoseList.productshoseboys;
    productShoseList=ProductShoseList.productshoseKidsgirl;
    productShoseList=ProductShoseList.productshoseOthers;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TabBarView(
        children: [
          ListView.builder(
              itemCount: ProductShoseList.productshoseMen.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductShose(productShoseList: ProductShoseList.productshoseMen[index],)),
          ListView.builder(
              itemCount: ProductShoseList.productshosewomen.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductShose(productShoseList: ProductShoseList.productshosewomen[index],)),

          ListView.builder(
              itemCount: ProductShoseList.productshoseboys.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductShose(productShoseList: ProductShoseList.productshoseboys[index],)),
          ListView.builder(
              itemCount: ProductShoseList.productshoseKidsgirl.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductShose(productShoseList: ProductShoseList.productshoseKidsgirl[index],)),
          ListView.builder(
              itemCount: ProductShoseList.productshoseOthers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductShose(productShoseList: ProductShoseList.productshoseOthers[index],)),

        ],
      ),
    );
  }
}

