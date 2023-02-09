import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomSuffixicon extends StatelessWidget {
  const CustomSuffixicon({
    Key ?key, required this.icon1,
  }) : super(key: key);
  final String icon1;

  @override
  Widget build(BuildContext context) {
    return     Padding(

      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),

      child:   SvgPicture.asset(icon1,height: 18,),

    );
  }
}