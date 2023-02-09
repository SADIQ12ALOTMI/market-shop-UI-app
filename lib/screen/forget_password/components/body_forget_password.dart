import 'package:encomme_shop/components/custom_suffixicon.dart';
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/components/no_account_text.dart';
import 'package:encomme_shop/screen/signin/component/form_error.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'forget_password_FormText.dart';
class body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "Forget Password",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                "Please enter your email and we will send\n you a link to returns to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64,),
              ForgetPasswordForm(),

            ],
          ),
        ),
      ),
    );
  }
}
