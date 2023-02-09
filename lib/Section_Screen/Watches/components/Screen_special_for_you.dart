import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/Section_Screen/Watches/components/special_for_you_card.dart';
import 'package:encomme_shop/models/product_watch_list.dart';
import 'package:flutter/material.dart';
class ScreenSpecialForYou extends StatefulWidget {


  @override
  _ScreenSpecialForYouState createState() => _ScreenSpecialForYouState();
}

class _ScreenSpecialForYouState extends State<ScreenSpecialForYou> {
 late List<ProductWatchForYouList>productWatchForYouList;
  @override
  void initState() {
    productWatchForYouList =ProductWatchForYouList.productWatchForYouList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          Container(
            color: Colors.black,
          ),
          Column(
            children: [

              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),),
              Expanded(
                child: Container(decoration: BoxDecoration(
                  color: Colors.black,
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
                            child: SpacialForYouCard(productWatchForYouList: productWatchForYouList[index],),
                          )))
            ],
          ),
        ],
      ),
    );
  }
}