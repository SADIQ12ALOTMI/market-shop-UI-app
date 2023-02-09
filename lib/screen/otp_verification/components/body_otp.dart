import 'package:encomme_shop/screen/otp_verification/components/otp_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
class body extends StatelessWidget {

  final String password,email,firstname,lastname,address,phonenumber,countrycode,verificationId;

  const body({Key ?key,required this.password,required this.email,required this.firstname,required this.lastname,required this.address,required this.phonenumber,required this.countrycode,required this.verificationId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

          SizedBox(height: 32,),
          Text(
            "OTP Verification",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black)
          ),
          Text("We sent your code to "+countrycode +" "+phonenumber),
              buildtimer(),
              SizedBox(height: 32,),
              OTPFormVerification(verificationId: verificationId,password: password,phonenumber: phonenumber,firstname: firstname,lastname: lastname,countrycode: countrycode,address: address,email: email,),
              SizedBox(height: 32,),
              GestureDetector(
                  onTap: (){},
                  child: Text("Resend OTP Code",style: TextStyle(decoration: TextDecoration.underline),))

            ],
          ),
        ),
      ),
    );
  }
  Widget buildtimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in"),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text("00: ${value.toString()}",style: TextStyle(color: Colors.red[900]),),onEnd: (){},)
      ],
    );
  }
}
