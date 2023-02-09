

import 'package:encomme_shop/components/social.dart';
import 'package:encomme_shop/screen/sign_up/componet/sign_up_Form.dart';
import 'package:flutter/material.dart';

class body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text("Register Account", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black) ),
            Text(
              "Complete your details or continue \n with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SignUpForm(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SocialCard(icon1: "assets/icons/google_icon.svg",press: (){},),
              SocialCard(icon1: "assets/icons/facebook_2.svg",press: (){},),
              SocialCard(icon1: "assets/icons/twitter.svg",press: (){},),
            ],),
            SizedBox(height: 15),
            Text("By continuing your confirm that you agree \nwith our term and condition",textAlign:TextAlign.center,),
            SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}
