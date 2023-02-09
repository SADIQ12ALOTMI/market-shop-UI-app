import 'package:encomme_shop/constract.dart';
import 'package:encomme_shop/screen/otp_verification/components/body_otp.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final String password,
      email,
      firstname,
      lastname,
      address,
      phonenumber,
      countryCode,
      verificationId;

  const OTPScreen(
      {Key? key,
      required this.password,
    required  this.email,
    required  this.firstname,
    required  this.lastname,
    required  this.address,
    required  this.phonenumber,
    required  this.countryCode,
    required  this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("OTP"),
        centerTitle: true,
      ),
      body: body(
        verificationId: verificationId,
        phonenumber: phonenumber,
        countrycode: countryCode,
        email: email,
        password: password,
        firstname: firstname,
        lastname: lastname,
        address: address,
      ),
    );
  }
}
