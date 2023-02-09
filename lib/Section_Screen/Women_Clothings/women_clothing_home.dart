
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/models/product_WM_clo.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'component/product_women_clothing.dart';
class WomenClothingHome extends StatefulWidget {

final SectionOffers sectionOffers;

  const WomenClothingHome({Key ?key,required this.sectionOffers}) : super(key: key);

  @override
  _WomenClothingHomeState createState() => _WomenClothingHomeState();
}

class _WomenClothingHomeState extends State<WomenClothingHome> {
late  List<ProductCWMList> productCWMList;
  @override
  void initState() {
    productCWMList=ProductCWMList.productCWMList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
     appBar: AppBar(
       leading: BackPop(),
       title: Text(widget.sectionOffers.name!.toUpperCase()),
       centerTitle: true,
       actions: [
         Padding(
           padding:
           EdgeInsets.symmetric(horizontal: 20, vertical: 5),
           child: IconWithBtnCounter(
             iconsvg: "assets/icons/CartIcon.svg",
             press: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartHomeScreen()));},
             numOfItem: CartStorList.cartStorList.length,
           ),
         ),
       ],
     ),

      body: Stack(
        children: [
          Container(

            child: Image(image: AssetImage("assets/images/model.png"),fit: BoxFit.fill,),
          ),
          Column(
            children: [

               Spacer(),
              SizedBox(height: 350,
              // child: Scroll
child: AnimationLimiter(

  child:   ListView.builder(
    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: productCWMList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index)=>AnimationConfiguration.staggeredList(
          position: index,
          delay: Duration(milliseconds: 100),

          child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,horizontalOffset: 230,
              verticalOffset: 50,
              child: FlipAnimation(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.x,
                  child: ProductWomenClothing(productCWMList: productCWMList[index],))))),
),
              ),
              SizedBox(height: 20,),
            ],
          )
        ],
      ),
    );
  }
}

