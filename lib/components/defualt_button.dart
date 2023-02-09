import 'package:flutter/material.dart';


class DefualtButton extends StatelessWidget {
  const DefualtButton({
    Key ?key, this.text, this.press,
  }) : super(key: key);
  final String? text;
  final Function() ? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
         style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)
           ),
           backgroundColor: Colors.brown,
         ),


          onPressed: press, child: Text(text??'',style: TextStyle(fontSize: 18,color: Colors.black),)),
    );
  }
}