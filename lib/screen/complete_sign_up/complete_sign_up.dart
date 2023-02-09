
import 'package:flutter/material.dart';

import '../../constract.dart';
import 'components/body_complete_sign_up.dart';
class CompleteSignUp extends StatelessWidget {

  final String Password,Email;

  const CompleteSignUp({Key ?key,required this.Password,required this.Email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Complete Sign Up"),
        centerTitle: true,
      ),
      body: body(Password: Password,Email: Email,),
    );
  }
}
