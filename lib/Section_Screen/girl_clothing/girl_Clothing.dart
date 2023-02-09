import 'package:encomme_shop/Section_Screen/girl_clothing/component/product_girl_card.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Sections_ourOffers.dart';
import 'package:encomme_shop/models/product_girl_clothes.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
class GirlCloScreen extends StatelessWidget {

final SectionOffers sectionOffers;

  const GirlCloScreen({Key ?key,required this.sectionOffers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionOffers.name!),
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
      body: body(),
    );
  }
}

class body extends StatefulWidget {
  const body({
    Key ?key,
  }) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
 late List<ProductGirlCList>productGirlCList;
  int currentbag=0;
  List< String> splashData = [

       "assets/images/girlclo/girl_scrol1.jpg",

       "assets/images/girlclo/girl_scrol2.jpg",

       "assets/images/girlclo/girl_scrol3.jpg",

      "assets/images/girlclo/girl_scrol4.jpg",
    "assets/images/girlclo/girl_scrol5.jpg",
    "assets/images/girlclo/girl_scroll6.jpg"

  ];
  @override
  void initState() {
    productGirlCList=ProductGirlCList.productCWMList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentbag=value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context,index)=>Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),

                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),

                      child: Image.asset(
                        splashData[index],
                        width: double.infinity,

                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 5,
                    child: Row(
                      children: [
                        ...List.generate(splashData.length, (index) =>  Padding(
                          padding:EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: 5,
                            width: 20,
                            color:currentbag==index? Colors.pink:Colors.white,
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),),
        ),
        Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.5,
            mainAxisSpacing: 10,
            childAspectRatio: 0.60,),itemCount: productGirlCList.length, itemBuilder: (context,index)=>ProductGirlCard(productGirlCList: productGirlCList[index],)),
        )

      ],
    );
  }
}
