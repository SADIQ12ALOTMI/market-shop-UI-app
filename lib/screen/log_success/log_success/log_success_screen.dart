import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/constract.dart';

import 'package:encomme_shop/screen/home_page_screen/home_page_screen.dart';
import 'package:flutter/material.dart';
class LogSuccessScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/success.png",
              height:320,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Login Success",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Spacer(),
            SizedBox(
                width: 216,
                child: DefualtButton(text: "Back to home",press: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage ()));
                },)),
            Spacer(),
          ],

        ),
      ),
    );
  }
}
