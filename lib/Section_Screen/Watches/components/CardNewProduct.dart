import 'package:flutter/material.dart';
class CardNewProductWatch extends StatelessWidget {
  const CardNewProductWatch({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 310,
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.black.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/watches/smartwatch16.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "New Products",
                style: TextStyle(color: Colors.white.withOpacity(.8)),
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Smart Watches  ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    TextSpan(
                      text: "X1",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ])),
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}