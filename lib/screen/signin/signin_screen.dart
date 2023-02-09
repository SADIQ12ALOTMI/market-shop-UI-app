

import 'package:flutter/material.dart';

import '../../constract.dart';
import 'component/body_sign_in.dart';
class SignInScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:(){Navigator.of(context).pop();}),
        title: Text("Logo".toUpperCase(),style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: body(),
    );
  }
}
