import 'package:encomme_shop/models/ouroffers_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'Cart_of_best.dart';
class SectionCard extends StatefulWidget {
  const SectionCard({
    Key ?key,
    required this.name,
    required  this.imag, this.press,
  }) : super(key: key);
  final String name, imag;
  final Function()? press;

  @override
  _SectionCardState createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  bool isPressed2 = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Container(
        height: 200,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(widget.imag),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onHighlightChanged: (value) {
                      setState(() {
                        isHighlighted = !isHighlighted;
                      });
                    },
                    onTap: () {
                      setState(() {
                        isPressed2 = !isPressed2;
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
                      height: isHighlighted ? 40 : 35,
                      width: isHighlighted ? 40 : 35,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(5, 10),
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: isPressed2
                          ? Icon(
                        Icons.favorite_border,
                        color: Colors.black.withOpacity(0.6),
                      )
                          : Icon(
                        Icons.favorite,
                        color: Colors.pink.withOpacity(1.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListViewProduct extends StatelessWidget {
  final List<OurOffersProduct> ourOfferproduct;

  const ListViewProduct({Key? key,required this.ourOfferproduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: ourOfferproduct.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext c, int i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            delay: Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: -900,
              verticalOffset: -350.0,
              child: FlipAnimation(
                duration: Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: CartOfBest1(
                  offersProduct: ourOfferproduct[i],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

