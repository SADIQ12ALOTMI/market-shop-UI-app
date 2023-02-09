import 'package:encomme_shop/models/product_headphone_list.dart';
import 'package:flutter/material.dart';

import 'ClipCurve_detials_earphone.dart';
class bodyEarphoneDetails extends StatefulWidget {
 final ProductHeadPhoneList productHeadPhoneList;
 final ProductHeadPhoneForYouList productHeadPhoneForYouList;
 final bool isforyou;

  const bodyEarphoneDetails({Key ?key,required this.productHeadPhoneList,required this.productHeadPhoneForYouList, this.isforyou=true}) : super(key: key);
  @override
  _bodyEarphoneDetailsState createState() => _bodyEarphoneDetailsState();
}

class _bodyEarphoneDetailsState extends State<bodyEarphoneDetails> {



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipCurveBackDSW(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("E N J O Y ___  W I T H"),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Text(widget.isforyou? widget.productHeadPhoneForYouList.nameHP:widget.productHeadPhoneList.nameHP ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 240,
                  child: Hero(
                      tag: widget.isforyou?widget.productHeadPhoneForYouList:widget.productHeadPhoneList,
                      child: Image.asset(widget.isforyou? widget.productHeadPhoneForYouList.imagHP:widget.productHeadPhoneList.imagHP)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 6),
                              color: Colors.black54,
                              blurRadius: 10)
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 6),
                              color: Colors.black54,
                              blurRadius: 10)
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.scatter_plot_outlined,
                        size: 25,
                        color: Colors.red[300],
                      ),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$ ${widget.isforyou? widget.productHeadPhoneForYouList.priceHP:widget.productHeadPhoneList.priceHP}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,color: Colors.red),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color:"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Pink",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Company's name"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.isforyou? widget.productHeadPhoneForYouList.nameCompany:widget.productHeadPhoneList.nameCompany,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18,color: Colors.pinkAccent),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Overview :\n",style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: widget.isforyou? widget.productHeadPhoneForYouList.subtitailHp:widget.productHeadPhoneList.subtitailHp, style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black))
                  ])),
              SizedBox(height: 10,),

            ],
          ),
        )
      ],
    );
  }
}