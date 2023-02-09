import 'package:flutter/material.dart';
class ContextSplash extends StatelessWidget {
  const ContextSplash({
    Key ?key,required this.text,required this.img,
  }) : super(key: key);
  final String text,img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(img)),
        SizedBox(height: 10,),
        Text(text.toUpperCase())
      ],
    );
  }
}