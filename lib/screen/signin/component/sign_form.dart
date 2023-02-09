
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/screen/Splash_logo_homePage/Splash_logo_homePage.dart';
import 'package:encomme_shop/screen/forget_password/forget_password_screen.dart';
import 'package:encomme_shop/screen/log_success/log_success/log_success_screen.dart';
import 'package:encomme_shop/screen/sign_up/screen_sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../constants.dart';
import 'form_error.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
   final _auth = FirebaseAuth.instance;
  final _keyform = GlobalKey<FormState>();
  String email='';
  String password='';
  bool remmeber = false;
  final List<String> errors = [];

  void addErrore({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyform,
        child: Column(
      children: [
        SizedBox(height: 20,),
        buildTextFormFieldEmail(context),
        SizedBox(height: 30,),
        buildTextFormFieldPassword(context),

        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
                value: remmeber,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remmeber = value!;
                  });
                }),
            Text("Remmeber me"),
            Spacer(),
            GestureDetector(
              onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));

              },
              child: Text(
                "Forget Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
         FormError(errors: errors),
        SizedBox(height: 40,),

        DefualtButton(
          text: "Sign In",
          press: () {
            signIn(emailController.text,passwordController.text);

          })
        
      ],
    ));
  }

  TextFormField buildTextFormFieldEmail(BuildContext context) {
    return TextFormField(
      controller: emailController,
keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.isNotEmpty ) {
          removeError(error: kEmailNullError);

        }  else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty ) {
          addErrore(error: kEmailNullError);
          return "";
        } else
        if(!emailValidatorRegExp.hasMatch(value) ){
          addErrore(error: kInvalidEmailError);
          return "";
        }
        return null;
      },

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,color: Colors.black),
          hintText: "Enter your email",
          labelText: ' Email',
          labelStyle: TextStyle(
            color:Colors.brown,
          ),

          suffixIcon: Icon(
            Icons.check_circle,color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.brown),
          ),
        ),
      );
  }
  TextFormField buildTextFormFieldPassword(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        if (value.isNotEmpty ) {
          removeError(error: kPassNullError);
        } else if (value.length <= 8  ) {
          removeError(error: kShortPassError);

        }
        return null;
      },

      validator: (value) {
        if (value!.isEmpty ) {
          addErrore(error: kPassNullError);
          return "";
        } else if (value.length > 8 ) {
          addErrore(error: kShortPassError);
          return "";

        }
        return null;
      },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,color: Colors.black),
          hintText: "Enter your password",
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.brown,
          ),


          suffixIcon: Icon(
            Icons.check_circle,color: Colors.black
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
        ),
      );
  }
  Future<void> signIn(String email,String password)  async {
    if (_keyform.currentState!.validate()) {
      _keyform.currentState!.save();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SplashLogoHome())),
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }


}
