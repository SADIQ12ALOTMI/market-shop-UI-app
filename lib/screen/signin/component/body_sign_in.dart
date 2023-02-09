

import 'package:encomme_shop/components/no_account_text.dart';
import 'package:encomme_shop/components/social.dart';
import 'package:encomme_shop/screen/signin/component/sign_form.dart';
import 'package:flutter/material.dart';

class body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              "Welcome Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black),
            ),
            Text(
              "Sign In with your email and password\nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),


           SignForm(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                 SocialCard(icon1:"assets/icons/google_icon.svg",press: (){},),
                SizedBox(width: 10,),
                 SocialCard(icon1: "assets/icons/facebook_2.svg",press: (){},),
                SizedBox(width: 10,),
                SocialCard(icon1: "assets/icons/twitter.svg",press: (){},),

              ],
            ),
            SizedBox(height: 20,),
            NoAccountText(),
            SizedBox(height: 30,)
        ],
    ),
      ),
    );
  }

}

