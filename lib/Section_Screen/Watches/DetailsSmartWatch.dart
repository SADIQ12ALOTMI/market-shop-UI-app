import 'package:animated_button/animated_button.dart';
import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_watch_list.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';

class DetailsSmartWatch extends StatefulWidget {
  final ProductWatchForYouList? productWatchForYouList;
  final ProductWatchList? productWatchList;
  final bool isforyou;

  const DetailsSmartWatch(
      {Key? key,
      this.productWatchForYouList,
      this.productWatchList,
      this.isforyou = true})
      : super(key: key);

  @override
  _DetailsSmartWatchState createState() => _DetailsSmartWatchState();
}

class _DetailsSmartWatchState extends State<DetailsSmartWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackPop(),
        title: Text(
          "S W ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
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
          ClipCurveBackDSW(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("S M A R T"),
                    Container(
                      height: 2,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.isforyou
                      ? widget.productWatchForYouList!.nameWch
                      : widget.productWatchList!.nameWch,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    height: 240,
                    child: Hero(
                        tag: widget.isforyou
                            ? widget.productWatchForYouList!
                            : widget.productWatchList!,
                        child: Image.asset(widget.isforyou
                            ? widget.productWatchForYouList!.imagWch
                            : widget.productWatchList!.imagWch)),
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
                          "\$ ${widget.isforyou ? widget.productWatchForYouList!.price : widget.productWatchList!.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red),
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Strap:"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.isforyou
                              ? widget.productWatchForYouList!.strap
                              : widget.productWatchList!.strap,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.pinkAccent),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Overview :\n",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: widget.isforyou
                          ? widget.productWatchForYouList!.subtitailWch
                          : widget.productWatchList!.subtitailWch,
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black))
                ])),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    AddToCart(cartStorList: CartStorList(
                        imagcart: widget.isforyou
                            ? widget.productWatchForYouList!.imagWch
                            : widget.productWatchList!.imagWch,
                        titalcart: widget.isforyou
                            ? widget.productWatchForYouList!.nameWch
                            : widget.productWatchList!.nameWch,
                        price: widget.isforyou
                            ? widget.productWatchForYouList!.price
                            : widget.productWatchList!.price,
                        numproduct: 1
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: BuyNowButton())
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClipCurveBackDSW extends StatelessWidget {
  const ClipCurveBackDSW({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        ClipPath(
          clipper: CliperSmartWatch(),
          child: Container(
            height: 340,
            color: Colors.blueGrey[50],
          ),
        ),
      ],
    );
  }
}

class CliperSmartWatch extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 70,
    );
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
