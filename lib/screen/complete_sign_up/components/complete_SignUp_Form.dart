import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encomme_shop/UserLog/user_model.dart';
import 'package:encomme_shop/components/custom_suffixicon.dart';
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/screen/otp_verification/otp_screen.dart';
import 'package:encomme_shop/screen/signin/component/form_error.dart';
import 'package:encomme_shop/screen/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constants.dart';

class CompleteSignUpForm extends StatefulWidget {
  final String Password,Email;

  const CompleteSignUpForm({Key? key,required this.Password,required this.Email}) : super(key: key);
  @override
  _CompleteSignUpFormState createState() => _CompleteSignUpFormState();
}

class _CompleteSignUpFormState extends State<CompleteSignUpForm> {

   final _auth = FirebaseAuth.instance;

  // our form key
String? dialcodeDigit;
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final phonenumberEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();

  final _keyform = GlobalKey<FormState>();
  final List<String> errors = [];
   String verificationId='';
  String firstname='';
  String secondname='';
   String phonenumber='' ;
  String address='';

  void addErrore({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String ?error}) {
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
          SizedBox(
            height: 20,
          ),
          buildTextFormFieldFirstName(context),
          SizedBox(
            height: 20,
          ),
          buildTextFormFieldSecondName(context),
          SizedBox(
            height: 20,
          ),
          buildIntlPhoneField(),
          SizedBox(
            height: 20,
          ),
          buildTextFormFieldAddressLocation(context),
          SizedBox(
            height: 20,
          ),
          FormError(errors: errors),
          DefualtButton(
            text: "Create Account",
            press: ()  {
              if (_keyform.currentState!.validate()) {
                _keyform.currentState!.save();}
              // verificatPhone();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OTPScreen(firstname: firstname,lastname: secondname,password: widget.Password,email: widget.Email,phonenumber: phonenumber,address: address,countryCode: dialcodeDigit,verificationId: verificationId,)));
              signUp(widget.Email,widget.Password);


              },
          )
        ],
      ),
    );
  }
_verficationphone()async{
  await _auth.verifyPhoneNumber(
      phoneNumber:dialcodeDigit!+phonenumber,
      verificationFailed: (FirebaseAuthException e){
        print(e.message);
      },
      codeSent: (String? verificatId,int? resentcode){
        setState(() {
          verificationId=verificatId!;
        });
  },
    codeAutoRetrievalTimeout: (String verificationID){
        setState(() {
          verificationId=verificationID;
        });
    },
    timeout: Duration(seconds: 60), verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },

  );
}
  TextFormField buildTextFormFieldFirstName(BuildContext context) {
    return TextFormField(
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstname = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErrore(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your first name",
        labelText: ' First Name',
        labelStyle: TextStyle(
          color: Colors.brown,
        ),
        suffixIcon: CustomSuffixicon(
          icon1: "assets/icons/User.svg",
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.brown),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldSecondName(BuildContext context) {
    return TextFormField(
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => secondname = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErrore(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your Last name",
        labelText: ' Last Name',
        labelStyle: TextStyle(
          color: Colors.brown,
        ),
        suffixIcon: CustomSuffixicon(
          icon1: "assets/icons/User.svg",
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.brown),
        ),
      ),
    );
  }

  IntlPhoneField buildIntlPhoneField() {
    return IntlPhoneField(
      controller: phonenumberEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Phone Number',

        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: UnderlineInputBorder(),
      ),
      initialCountryCode: 'US',
onSaved: (value){
  setState(() {
    phonenumber=value!.number!;
     dialcodeDigit=value.countryCode;
  });
},

    );
  }

  TextFormField buildTextFormFieldAddressLocation(BuildContext context) {
    return TextFormField(
      controller: addressEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => address = newValue!,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErrore(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your address",
        labelText: ' Address',
        labelStyle: TextStyle(
          color: Colors.brown,
        ),
        suffixIcon: CustomSuffixicon(
          icon1: "assets/icons/Location_point.svg",
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.brown),
        ),
      ),
    );
  }
   void signUp(String email, String password) async {
     if (_keyform.currentState!.validate()) {
       _keyform.currentState!.save();
       await _auth
           .createUserWithEmailAndPassword(

           password: password,email: email
       )
           .then((value) => {postDetailsToFirestore()})
           .catchError((e) {
         Fluttertoast.showToast(msg: e.message);
       });
     }
   }
   void verificatPhone() async {
     if (_keyform.currentState!.validate()) {
       _keyform.currentState!.save();
       await _auth.verifyPhoneNumber(phoneNumber:dialcodeDigit!+phonenumber,
           verificationCompleted: (PhoneAuthCredential credential) async {
             await _auth
                 .signInWithCredential( credential).then((value)async {
               if (value.user!=null){

               }
             });


           },
           verificationFailed: (FirebaseAuthException e){
             print(e.message);
           }, codeSent: (String? verifId,int? sendCode){
             setState(() {
               verificationId=verifId!;
             });
           }, codeAutoRetrievalTimeout: (String verifID){
             setState(() {
               verificationId=verifID;
             });
           });

     }
   }

   postDetailsToFirestore() async {
     // calling our firestore
     // calling our user model
     // sedning these values

     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
     User user = _auth.currentUser!;

     UserModel userModel = UserModel();

     // writing all the values
     userModel.email = user.email;
     userModel.uid = user.uid;
     userModel.firstName = firstNameEditingController.text;
     userModel.lastName = secondNameEditingController.text;
     userModel.phonebnumber = phonenumberEditingController.text;
     userModel.addresslocatation = addressEditingController.text;


     await firebaseFirestore
         .collection("users")
         .doc(user.uid)
         .set(userModel.toMap());
     Fluttertoast.showToast(msg: "Account created successfully :) ");

     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInScreen()));}
}
