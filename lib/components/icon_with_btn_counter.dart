import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class IconWithBtnCounter extends StatelessWidget {
  final String iconsvg;
  final int numOfItem;
  final GestureTapCallback press;

  const IconWithBtnCounter({Key ?key,
    required this.iconsvg,
    this.numOfItem=0,
    required  this.press})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(

        children: [
          Container(
            padding: EdgeInsets.all(12),
            height:46,
            width: 46,
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(iconsvg),
          ),
          if(numOfItem!=0)
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(width: 1.5, color: Colors.white),
                  shape: BoxShape.circle),
              child: Center(
                child: Text(
                  "${numOfItem}",
                  style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}