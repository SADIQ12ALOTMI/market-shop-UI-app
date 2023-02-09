
import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/Product_accessoris_list.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
class DetailsProductAccessoriesScreens extends StatelessWidget {
final ProductAccessoriseList productAccessoriseList;
final bool Isfivorate;

  const DetailsProductAccessoriesScreens({Key ?key, required this.productAccessoriseList,required this.Isfivorate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(cartStorList: CartStorList(imagcart: productAccessoriseList.imagAcc,titalcart: productAccessoriseList.nameAcc,price: productAccessoriseList.priceAcc,numproduct: 1),),
            SizedBox(width: 15,),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: BackPop(),
        title: Text("P-J E W E L L E R Y"),
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
          Column(
            children: [
              Container(
                height: 200,
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Image.asset(productAccessoriseList.imagAcc!),
),
              ),
              Expanded(child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productAccessoriseList.nameAcc!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blueAccent),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ ${productAccessoriseList.priceAcc}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.red[700]),),
                          Row(children: [
                            Text("Rating",style: TextStyle(fontSize: 18,color: Colors.black),),
                            SizedBox(width: 8,),
                            Row(children: [
                              Icon(Icons.star,color: Colors.orangeAccent,size: 20,),
                              Text("4.2",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)
                            ],)
                          ],)
                        ],
                      ),
                      SizedBox(height: 10,),
Row(
  children: [
    Text("Gram :   ",style: TextStyle(fontSize: 18),),
    Text("4 g",style: TextStyle(fontSize: 18,color: Colors.red),),

  ],
),
                      SizedBox(height: 15,),
                      RichText(text: TextSpan(children: [
                        TextSpan(text: "Description :\n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                        TextSpan(text: productAccessoriseList.subtitalAcc,style: TextStyle(fontSize: 12,color: Colors.black38))
                      ]))
                    ],
                  ),
                ),
              )),

            ],
          ),
          Positioned(
              top: 170,
              right: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,6),
                          color: Colors.black38,
                          blurRadius: 10
                      )
                    ]
                ),
                child: IconButton(icon: Icon(Icons.favorite_outlined,size: 35,color:Isfivorate? Colors.white:Colors.red), onPressed: () {  },),
              )),
        ],
      ),
    );
  }
}
