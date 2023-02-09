import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SocialCard extends StatelessWidget {
  const SocialCard({
    Key ?key, this.icon1, this.press, this.icons,
  }) : super(key: key);
  final String? icon1;
  final Function()? press;
  final Icon? icons;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(12.0),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon1!),
      ),
    );
  }
}