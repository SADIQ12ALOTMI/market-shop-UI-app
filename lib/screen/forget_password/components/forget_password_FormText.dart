import 'package:encomme_shop/components/custom_suffixicon.dart';
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/components/no_account_text.dart';
import 'package:encomme_shop/screen/signin/component/form_error.dart';
import 'package:encomme_shop/screen/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
class ForgetPasswordForm extends StatefulWidget {


  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  List<String> errors = [];
  final _keyform=GlobalKey<FormState>();
  final FirebaseAuth _auth=FirebaseAuth.instance ;
  String? email;
  void addErrore({String? error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error!);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)){
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
          TextFormField(
            onSaved: (newvale) => email = newvale,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isNotEmpty ) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addErrore(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value) ) {
                addErrore(error: kInvalidEmailError);
                return "";              }
              return null;
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Enter your email",
              labelText: "Email",
              suffixIcon: CustomSuffixicon(icon1: "assets/icons/Mail.svg",),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.brown),
              ),


            ),
          ),
          SizedBox(height:30,),
          FormError(errors: errors),
          SizedBox(height: 64,),
          DefualtButton(text: "Send",press: (){
            if(_keyform.currentState!.validate()){
_keyform.currentState!.save();
resetpassword();
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInScreen()));
            }
          },),
          SizedBox(height: 64,),
          NoAccountText()
        ],
      ),

    );
  }

  void resetpassword()async{
  try{
    await _auth.sendPasswordResetEmail(email: email!);
  }
  catch(e){
Fluttertoast.showToast(msg: e.toString());
  }
  }
}
