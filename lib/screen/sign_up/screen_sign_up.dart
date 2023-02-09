
import 'package:flutter/material.dart';

import '../../constract.dart';
import 'componet/body_sign_up.dart';
class SignUpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: body(),
    );
  }
}
