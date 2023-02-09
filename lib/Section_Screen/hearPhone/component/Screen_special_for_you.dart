import 'package:encomme_shop/Section_Screen/hearPhone/component/special_for_you_card.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/models/product_headphone_list.dart';

import 'package:flutter/material.dart';
class ScreenSpecialForYouHeadPhone extends StatefulWidget {
  const ScreenSpecialForYouHeadPhone({
    Key ?key,
  }) : super(key: key);

  @override
  _ScreenSpecialForYouHeadPhoneState createState() => _ScreenSpecialForYouHeadPhoneState();
}

class _ScreenSpecialForYouHeadPhoneState extends State<ScreenSpecialForYouHeadPhone> {

late  List<ProductHeadPhoneForYouList>productHeadPhoneForYouList;
  @override
  void initState() {

    productHeadPhoneForYouList=ProductHeadPhoneForYouList.productHeadPhoneForYouList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          Container(
            color: Colors.red[100],
          ),
          Column(
            children: [

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),),
              Expanded(
                child: Container(decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                ),),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BackPop(),
                  SizedBox(width: 20,),
                  Text("Special For You",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: SpacialForYouCardHeadPhone(productHeadPhoneForYouList: productHeadPhoneForYouList[index],),
                          )))
            ],
          ),
        ],
      ),
    );
  }
}