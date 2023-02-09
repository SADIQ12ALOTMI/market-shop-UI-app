import 'package:encomme_shop/constract.dart';
import 'package:encomme_shop/screen/forget_password/components/body_forget_password.dart';
import 'package:flutter/material.dart';
class ForgetPasswordScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: body(),
    );
  }
}
