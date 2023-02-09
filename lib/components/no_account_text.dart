
import 'package:encomme_shop/screen/sign_up/screen_sign_up.dart';
import 'package:flutter/material.dart';


import '../constants.dart';
class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key ?key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",style: TextStyle(color: Colors.black,fontSize: 16)),
        GestureDetector(
             onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));},
            child: Text("Sign Up",style: TextStyle(color: kPrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),))
      ],
    );
  }
}