import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/productMen_clothes.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';

class DetailsProductMenClothes extends StatefulWidget {
  final ProductMMCList  productMMCList;

  const DetailsProductMenClothes({Key ?key,required this.productMMCList})
      : super(key: key);

  @override
  _DetailsProductMenClothesState createState() =>
      _DetailsProductMenClothesState();
}

class _DetailsProductMenClothesState extends State<DetailsProductMenClothes> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        leading: BackPop(),
        backgroundColor: Colors.grey[200],
        title: Text("M ____> C"),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(
              cartStorList: CartStorList(
                  imagcart: widget.productMMCList.productMMC![currentindex].imag,
                  titalcart: widget.productMMCList.productMMC![currentindex].tital ,
                  price: widget.productMMCList.productMMC![currentindex].price ,
                  numproduct: widget.productMMCList.productMMC!.length),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: BuyNowButton(),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          ClipCurveBackDSW(),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DetialsPMenCloth(
                productMMCList: widget.productMMCList,
                index1: currentindex,
              )),
          Positioned(
            right: 5,
            top: 5,
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...List.generate(
                            widget.productMMCList.productMMC!.length,
                            (index) => SelectProductMC(index)),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding SelectProductMC(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentindex = index;
          });
        },
        child: Container(
          height: currentindex == index ? 60 : 50,
          width: currentindex == index ? 60 : 50,
          decoration: BoxDecoration(
            color: currentindex == index ? Colors.brown[100] : Colors.white70,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
                tag: widget.productMMCList.productMMC!,
                child:
                    Image.asset(widget.productMMCList.productMMC![index].imag!)),
          ),
        ),
      ),
    );
  }
}

class BottomNBPMClothes extends StatelessWidget {
  const BottomNBPMClothes({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 2)]),
              child: Icon(Icons.add_shopping_cart),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.cyan[200],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 3), blurRadius: 2)
                    ]),
                child: Center(
                    child: Text(
                  "Buy Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetialsPMenCloth extends StatelessWidget {
  const DetialsPMenCloth({
    Key ?key,
    required this.productMMCList,
    required this.index1,
  }) : super(key: key);
  final int index1;

  final ProductMMCList productMMCList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("C L O T H E S "),
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
            productMMCList.productMMC![index1].tital!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 240,
              child: Image.asset(productMMCList.productMMC![index1].imag!),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 50,
          //       width: 50,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //                 offset: Offset(0, 6),
          //                 color: Colors.black54,
          //                 blurRadius: 10)
          //           ]),
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.favorite_outlined,
          //           size: 25,
          //           color: Colors.black,
          //         ),
          //         onPressed: () {},
          //         color: Colors.white,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Container(
          //       height: 50,
          //       width: 50,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //                 offset: Offset(0, 6),
          //                 color: Colors.black54,
          //                 blurRadius: 10)
          //           ]),
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.scatter_plot_outlined,
          //           size: 25,
          //           color: Colors.red[300],
          //         ),
          //         onPressed: () {},
          //         color: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price :"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$ ${productMMCList.productMMC![index1].price}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rating :"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_outline,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                  Text(
                    "3.6",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("QTE :"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "126",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                text: "Overview :\n", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: productMMCList.productMMC![index1].subtital,
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black))
          ])),
          SizedBox(
            height: 10,
          ),
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
