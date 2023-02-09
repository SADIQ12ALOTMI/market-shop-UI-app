import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
class BuyNowButton extends StatefulWidget {
  const BuyNowButton({
    Key ?key,
  }) : super(key: key);

  @override
  _BuyNowButtonState createState() => _BuyNowButtonState();
}

class _BuyNowButtonState extends State<BuyNowButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      color: Colors.cyan[200]!,
      height: 50,
      width: 250,
      shadowDegree: ShadowDegree.dark,
      onPressed: () {},
      child: Center(
          child: Text(
            "Buy Now",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22),
          )),
    );
  }
}
