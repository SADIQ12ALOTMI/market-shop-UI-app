import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Product_accessoris_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';

import 'components/Accessores_producy_card.dart';

class AccessoriseScreen extends StatefulWidget {
  final SectionOffers? sectionOffers;


  const AccessoriseScreen({Key? key, this.sectionOffers}) : super(key: key);

  @override
  _AccessoriseScreenState createState() => _AccessoriseScreenState();
}

class _AccessoriseScreenState extends State<AccessoriseScreen> {
 late List<ProductAccessoriseList>productAccessoriseList;
  @override
  void initState() {
    productAccessoriseList=ProductAccessoriseList.productAccessoriseList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackPop(),
        title: Text(widget.sectionOffers!.name!),
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
      body: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Image.asset(
                "assets/images/accessories/OjeweP.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                 childAspectRatio: 0.75,
                   crossAxisSpacing: 6,
                   mainAxisSpacing: 10,
                ),
                itemCount: ProductAccessoriseList.productAccessoriseList.length,
                itemBuilder: (context,index)=>ProductAccessorCard(productAccessoriseList: productAccessoriseList[index],)),
          )
        ],
      ),
    );
  }
}
