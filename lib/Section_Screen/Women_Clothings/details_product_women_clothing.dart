import 'package:encomme_shop/components/add_cart_button.dart';
import 'package:encomme_shop/components/back_pop.dart';
import 'package:encomme_shop/components/buy_now_button.dart';
import 'package:encomme_shop/components/icon_with_btn_counter.dart';
import 'package:encomme_shop/models/Cart_list.dart';
import 'package:encomme_shop/models/product_WM_clo.dart';
import 'package:encomme_shop/screen/stor_cart/cart_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DetailsProductWomenClothing extends StatefulWidget {
  final ProductCWMList productCWMList;

  const DetailsProductWomenClothing({Key ?key, required this.productCWMList})
      : super(key: key);

  @override
  _DetailsProductWomenClothingState createState() =>
      _DetailsProductWomenClothingState();
}

class _DetailsProductWomenClothingState
    extends State<DetailsProductWomenClothing> {
  int selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        height: 65,
        width: double.infinity,
        child: Row(
          children: [
            AddToCart(
              cartStorList: CartStorList(
                  imagcart: widget.productCWMList.productWMC![selectindex].imag,
                  titalcart: widget.productCWMList.productWMC![selectindex].tital,
                  price: widget.productCWMList.productWMC![selectindex].price,
                  numproduct: widget.productCWMList.productWMC!.length),
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
      appBar: AppBar(
        leading: BackPop(),
        title: Text("Details".toUpperCase()),
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
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: RoundedDiagonalPathClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.red[100]),
                  ),
                ),
                Hero(
                    tag: widget.productCWMList,
                    child: Image.asset(
                      widget.productCWMList.productWMC![selectindex].imag!,
                      height: 280,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    right: 10,
                    top: 70,
                    child: SizedBox(
                        height: 100,
                        width: 150,
                        child: Text(
                          widget.productCWMList.productWMC![selectindex].tital!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
                Positioned(
                  right: 30,
                  bottom: 30,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Price :\n",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextSpan(
                        text:
                            "   \$ ${widget.productCWMList.productWMC![selectindex].price}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                  ])),
                ),
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: selectindex == 0 ? -50 : 20,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (selectindex > 0) {
                            setState(() {
                              selectindex--;
                            });
                          }
                        })),
                Positioned(
                    bottom: 0,
                    top: 0,
                    // right: -100,
                    right: selectindex ==
                            widget.productCWMList.productWMC!.length - 1
                        ? -100
                        : 10,
                    child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          if (selectindex <=
                              ProductCWMList.productCWMList.length) {
                            setState(() {
                              selectindex++;
                            });
                          }
                        })),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ComboBoxSelctSize(),
                      ComboBoxSelctColors(),
                      PutMarkToPage()
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Description :\n",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextSpan(
                        text: widget
                            .productCWMList.productWMC![selectindex].subtital,
                        style: TextStyle(color: Colors.black54))
                  ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      height: 50,
      width: double.infinity,
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
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.cyan[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 2)]),
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
    );
  }
}

class PutMarkToPage extends StatefulWidget {
  const PutMarkToPage({
    Key ?key,
  }) : super(key: key);

  @override
  _PutMarkToPageState createState() => _PutMarkToPageState();
}

class _PutMarkToPageState extends State<PutMarkToPage> {
  bool ismark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: ismark
            ? Icon(Icons.bookmark_outline)
            : Icon(
                Icons.bookmark_outlined,
                color: Colors.pink,
              ),
        onPressed: () {
          setState(() {
            ismark = !ismark;
          });
        });
  }
}

class ComboBoxSelctSize extends StatefulWidget {
  @override
  _ComboBoxSelctSizeState createState() => _ComboBoxSelctSizeState();
}

class _ComboBoxSelctSizeState extends State<ComboBoxSelctSize> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _value,
      elevation: 5,
      items: [
        DropdownMenuItem(
          child: Text("Size " + 45.toString()),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Size " + 47.toString()),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text("Size " + 49.toString()),
          value: 3,
        ),
        DropdownMenuItem(
          child: Text("Size " + 50.toString()),
          value: 4,
        ),
        DropdownMenuItem(
          child: Text("Size " + 42.toString()),
          value: 5,
        ),
      ],
      onChanged: (value) {
        setState(() {
          _value = value as int;
        });
      },
    );
  }
}

class ComboBoxSelctColors extends StatefulWidget {
  @override
  _ComboBoxSelctColorsState createState() => _ComboBoxSelctColorsState();
}

class _ComboBoxSelctColorsState extends State<ComboBoxSelctColors> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _value,
      elevation: 5,
      items: [
        DropdownMenuItem(child: Text("Black"), value: 1),
        DropdownMenuItem(child: Text("red"), value: 2),
        DropdownMenuItem(child: Text("white"), value: 3),
        DropdownMenuItem(child: Text("pink"), value: 4),
        DropdownMenuItem(child: Text("yelleow"), value: 5),
        DropdownMenuItem(child: Text("green"), value: 6),
        DropdownMenuItem(child: Text("blue"), value: 7),
      ],
      onChanged: ( int? value) {
        setState(() {
          _value = value!;
        });
      },
    );
  }
}
