
import 'package:flutter/material.dart';

import 'complete_SignUp_Form.dart';
class body extends StatelessWidget {

  final String Password,Email;

  const body({Key ?key,required this.Password,required this.Email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [
              Text(
                "Complete Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black)
              ),
              Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              CompleteSignUpForm(Password: Password,Email: Email,),
              SizedBox(height: 20,),
              Text("By continuing your confirm that you agree \nwith our term and condition",textAlign:TextAlign.center,),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
