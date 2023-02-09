import 'package:encomme_shop/components/BuildContainer_with_icon.dart';
import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_girl_clothes.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
class DetailsGrilClothes extends StatefulWidget {
  final ProductGirlCList productGirlCList;

  const DetailsGrilClothes({Key ?key,required this.productGirlCList}) : super(key: key);

  @override
  _DetailsGrilClothesState createState() => _DetailsGrilClothesState();
}

class _DetailsGrilClothesState extends State<DetailsGrilClothes> {
  int selectitem=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackPop(),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15,right: 15,),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(cartStorList: CartStorList(imagcart:widget.productGirlCList.productGirlC[selectitem].imag ,titalcart: widget.productGirlCList.productGirlC[selectitem].tital,price:widget.productGirlCList.productGirlC[selectitem].price ,numproduct: widget.productGirlCList.productGirlC.length),),
            SizedBox(width: 15,),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Hero(
                            tag: widget.productGirlCList,
                            child: Image.asset(widget.productGirlCList.productGirlC[selectitem].imag!))),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2 -10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 22, right: 20, bottom: 10, top: 25),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.productGirlCList.productGirlC[selectitem].tital!,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$ ${widget.productGirlCList.productGirlC[selectitem].price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.blue[700]),
                            ),
                            Row(
                              children: [
                                Text(
                                  " ${4.5}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 24,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Other Categories :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(


                                    widget.productGirlCList.productGirlC.length,
                                        (index) => GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectitem=index;
                                            });
                                          },
                                          child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                          children: [
                                            Container(
                                              width:selectitem==index? 70:60,
                                              height: selectitem==index? 70:60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),

                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.brown, width: 1)),
                                            ),
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              bottom: 5,
                                              left: 5,
                                              child: Container(
                                                height:selectitem==index? 60:50,
                                                width:selectitem==index? 60:50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                    color: Colors.cyan,
                                                   ),
                                                child: Image.asset(widget.productGirlCList.productGirlC[index].imag!),

                                              ),

                                            ),
                                          ],
                                      ),
                                    ),
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(widget.productGirlCList.productGirlC[selectitem].subtital!),

                        //   Row(
                        //   children: [
                        //     Container(
                        //       height: 40,
                        //       width: 50,
                        //       decoration: BoxDecoration(
                        //           border: Border.all(color: Colors.black45),
                        //           borderRadius: BorderRadius.circular(8),
                        //           color: Colors.white,
                        //           boxShadow: [
                        //             BoxShadow(offset: Offset(2,2),
                        //                 color: Colors.black26.withOpacity(0.1),
                        //                 blurRadius: 15),
                        //             BoxShadow(offset: Offset(-2,-2),
                        //                 color: Colors.black26.withOpacity(0.1),
                        //                 blurRadius: 15),
                        //           ]
                        //       ),
                        //       child: Center(child: IconButton(icon: Icon(Icons.add,size: 28,), onPressed: (){})),
                        //     ),
                        //     SizedBox(width: 20,),
                        //     Expanded(child: Container(
                        //       height: 40,
                        //       decoration: BoxDecoration(
                        //           color: Colors.lightBlue,
                        //           borderRadius: BorderRadius.circular(8),
                        //           boxShadow: [
                        //             BoxShadow(offset: Offset(2,2),
                        //                 color: Colors.blue.withOpacity(0.5),
                        //                 blurRadius: 15),
                        //             BoxShadow(offset: Offset(-2,-2),
                        //                 color: Colors.blue.withOpacity(0.1),
                        //                 blurRadius: 15),
                        //           ]
                        //       ),child: Center(child: Text("Add Cart",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                        //     ))
                        //   ],
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 50,
              top: 170,
              child: BuildContainerWithIcon(),
            )
          ],
        ),
      ),
    );
  }
}

