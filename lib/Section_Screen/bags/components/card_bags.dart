import 'package:encomme_shop/Section_Screen/bags/bags_details.dart';
import 'package:encomme_shop/models/product_bag_list.dart';
import 'package:flutter/material.dart';

import '../../../constract.dart';
class CardBags extends StatefulWidget {
 final ProductBagList productBagList;

  const CardBags({Key ?key,required this.productBagList}) : super(key: key);

  @override
  _CardBagsState createState() => _CardBagsState();
}

class _CardBagsState extends State<CardBags> {
  bool? islike;
  @override
  void initState() {
    islike=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BagsDetails(productBagList: widget.productBagList,)));

        },
        child: Container(
          height: 160,
          width: 320,
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-3, 6),
                    color: zbackgroundcolor,
                    blurRadius: 2),
              ]),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 5,top: 5,bottom: 5),
                child: Container(
                  height: 160,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.black54)
                      ]),
                  child: Hero(
                    tag: widget.productBagList,
                    child: Image(
                      image:
                      AssetImage(widget.productBagList.imagbag!),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.productBagList.namebag!,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                        width: 150,
                        child: Text(
                          "Elegant Ladies Handbag Honorable Girl Bag Sets High Quality PU Handbags",
                          maxLines: 3,
                        )),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.pink,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.pink,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.pink,
                            ),
                            Icon(
                              Icons.star_half,
                              size: 15,
                              color: Colors.pink,
                            ),
                            Icon(
                              Icons.star_outline,
                              size: 15,
                              color: Colors.pink,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                              Colors.pink.withOpacity(0.5)),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 100,),
                        InkWell(
                          onTap: (){
                            setState(() {
                              islike=!islike!;
                            });
                          },
                          child: Container(

                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0,3),
                                      color: Colors.black12
                                  ),
                                  BoxShadow(
                                      offset: Offset(0,-3),
                                      color: Colors.black12
                                  ),
                                ]
                            ),
                            child:islike!? Image.asset("assets/images/likeF.png"):Image.asset("assets/images/dontlikeF.png"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}