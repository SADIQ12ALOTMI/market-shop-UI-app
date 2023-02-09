import 'package:flutter/material.dart';
class BackPop extends StatelessWidget {
  const BackPop({
    Key? key, this.color,
  }) : super(key: key);
final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios,color: color,), onPressed: (){
      Navigator.of(context).pop();
    });
  }
}