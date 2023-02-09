
import 'package:encomme_shop/components/custom_suffixicon.dart';
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/screen/complete_sign_up/complete_sign_up.dart';
import 'package:encomme_shop/screen/signin/component/form_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';
class SignUpForm extends StatefulWidget {


  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
   final _auth = FirebaseAuth.instance;

  // our form key

  // editing Controller

  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final _formksy = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmpassword;
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
      key: _formksy,
      child: Column(
        children: [
          buildTextFormFieldEmail(context),
          SizedBox(height: 20,),
          buildTextFormFieldPassWord(context),
          SizedBox(height: 20,),
          buildTextFormFieldPassWordConfirm(context),

          SizedBox(height: 20,),
          FormError(errors: errors),
          DefualtButton(text: "Continue",press: (){
            if(_formksy.currentState!.validate()){
              _formksy.currentState!.save();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CompleteSignUp(Password: password!,Email: email!,)));
            }

         },)


        ],
      ),
    );
  }


  TextFormField buildTextFormFieldEmail(BuildContext context) {
    return TextFormField(
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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

        hintText: "Enter your email",
        labelText: ' Email',
        labelStyle: TextStyle(
          color:Colors.brown,
        ),

        suffixIcon:CustomSuffixicon(icon1: "assets/icons/Mail.svg",),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.brown),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldPassWord(BuildContext context) {
    return TextFormField(
      controller: passwordEditingController,

      onSaved: (newValue) => password = newValue,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.isNotEmpty ) {
          removeError(error: kPassNullError);
        } else if (value.length <= 8 ) {
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

        hintText: "Enter your password",
        labelText: ' Password',
        labelStyle: TextStyle(
          color:Colors.brown,
        ),

        suffixIcon:CustomSuffixicon(icon1: "assets/icons/Lock.svg",),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.brown),
        ),
      ),
    );
  }
  TextFormField buildTextFormFieldPassWordConfirm(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordEditingController,

      onSaved: (newValue) => confirmpassword = newValue,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (password==confirmpassword) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty ) {
          return "";
        } else if (password!=confirmpassword) {
          addErrore(error: kMatchPassError);
          return "";
        }
        return null;
      },

      decoration: InputDecoration(

        hintText: "Please confirm password",
        labelText: ' Confirm Password',
        labelStyle: TextStyle(
          color:Colors.brown,
        ),
        suffixIcon:CustomSuffixicon(icon1: "assets/icons/Lock.svg",),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.brown),
        ),
      ),
    );
  }

}
