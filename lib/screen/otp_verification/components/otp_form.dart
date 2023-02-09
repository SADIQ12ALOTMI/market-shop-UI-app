import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encomme_shop/UserLog/user_model.dart';
import 'package:encomme_shop/components/defualt_button.dart';
import 'package:encomme_shop/screen/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
class OTPFormVerification extends StatefulWidget {
  final String password,email,firstname,lastname,address,phonenumber,countrycode,verificationId;

  const OTPFormVerification({Key ?key,required this.password,required this.email,required this.firstname,required this.lastname,required this.address,required this.phonenumber,required this.countrycode,required this.verificationId}) : super(key: key);

  @override
  _OTPFormVerificationState createState() => _OTPFormVerificationState();
}

class _OTPFormVerificationState extends State<OTPFormVerification> {
  final _keyform=GlobalKey<FormState>();
  // String verificationId;
  // final firstNameEditingController = new TextEditingController();
  // final secondNameEditingController = new TextEditingController();
  // final phonenumberEditingController = new TextEditingController();
  // final addressEditingController = new TextEditingController();
  final _auth = FirebaseAuth.instance;
late FocusNode pin2FocusNode;
late FocusNode pin3FocusNode;
late FocusNode pin4FocusNode;
  @override
  void initState() {
    pin2FocusNode=FocusNode();
    pin3FocusNode=FocusNode();
    pin4FocusNode=FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }
  void nextField({ String? value,FocusNode? focusNode}){
    if(value!.length==1){
      focusNode!.requestFocus();
    }
  }
  String? varone;
  String? vartwo;
  String? varthree;
  String? varfour;
  String? CodeVerification;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width:60,
                child: TextFormField(
                  onSaved: (Ver)=>varone=Ver,
                  textAlign: TextAlign.center ,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value,focusNode: pin2FocusNode);
                  },
                ),
              ),
              SizedBox(width: 60,
                child: TextFormField(
                  onSaved: (Ver)=>varone=Ver,
                  textAlign: TextAlign.center ,
                  focusNode: pin2FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value,focusNode: pin3FocusNode);
                  },
                ),
              ),
              SizedBox(width:60,
                child: TextFormField(
                  onSaved: (Ver)=>varone=Ver,
                  textAlign: TextAlign.center ,
                  focusNode: pin3FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value,focusNode: pin4FocusNode);
                  },
                ),
              ),
              SizedBox(width:60,
                child: TextFormField(
                  onSaved: (Ver)=>varone=Ver,
                  textAlign: TextAlign.center ,
                  focusNode: pin4FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 96),
          DefualtButton(text: "Continue",press: (){
            setState(() {
              CodeVerification=varone!+vartwo!+varthree!+varfour!;
            });
            if(CodeVerification!=null){

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInScreen()));
            }

           },)
        ],
      ),
    );
  }
void _verification() async{

    await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: CodeVerification!)).then((value)async {
      if(value.user!=null){
     signUp(widget.email, widget.password);
      }
    });
}
  // void verificatPhone() async {
  //   if (_keyform.currentState.validate()) {
  //     _keyform.currentState.save();
  //     await _auth.verifyPhoneNumber(phoneNumber:widget.countrycode+widget.phonenumber,
  //         verificationCompleted: (PhoneAuthCredential credential) async {
  //           await _auth
  //               .signInWithCredential( credential).then((value)async {
  //             if (value.user!=null){
  //               // signUp(widget.email, widget.password)
  //             }
  //           });
  //
  //
  //     },
  //         verificationFailed: (FirebaseAuthException e){
  //       print(e.message);
  //         }, codeSent: (String verifId,int sendCode){
  //       setState(() {
  //         verificationId=verifId;
  //       });
  //         }, codeAutoRetrievalTimeout: (String verifID){
  //       setState(() {
  //         verificationId=verifID;
  //       });
  //         });
  //
  //   }
  // }
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
    userModel.firstName = widget.firstname;
    userModel.lastName = widget.lastname;
    userModel.phonebnumber = widget.phonenumber;
    userModel.addresslocatation = widget.address;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInScreen()));}
}
