import 'package:encomme_shop/Section_Screen/Men_Clothings/components/product_men_cloth_card.dart';
import 'package:encomme_shop/models/productMen_clothes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bodyMMC extends StatefulWidget {




  @override
  _bodyMMCState createState() => _bodyMMCState();
}

class _bodyMMCState extends State<bodyMMC> {
  int currentbag=0;
  List<Map<String, String>> splashData = [
  { "name": "The best online clothing stores for men",
  "imgs": "assets/images/menclothing_png/albany.jpg",},
{ "name": "Best Men's Online Clothing Stores in Australia ",
"imgs": "assets/images/menclothing_png/austrlia.jpg"},
{ "name": "Phillip's Men's Clothing ",
"imgs": "assets/images/menclothing_png/phlpain.jpg"},
{ "name": "TClassic Men Clothing ",
"imgs": "assets/images/menclothing_png/classic_shirt.jpg"}
  ];
 late List<ProductMMCList>productMMCList;

  @override
  void initState() {
    productMMCList=ProductMMCList.productMMCList;

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
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),

                        child: Image.asset(
                        splashData[index]["imgs"]!,
                          width: double.infinity,

                          fit: BoxFit.cover,
                        ),
                      ),
                     Positioned(
                         bottom: 3,
                         left: 8,
                         child: SizedBox(
                             width: 200,
                             child: Text(splashData[index]["name"]!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)))
                    ],
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
          child:GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                   crossAxisSpacing: 10.5,
                   mainAxisSpacing: 10,
                    childAspectRatio: 0.60,
              ),
              itemCount: productMMCList.length,
              itemBuilder: (context, index) => ProductMMClothesCard(productMMCList:productMMCList[index] ,)),
        )
      ],
    );
  }
}

