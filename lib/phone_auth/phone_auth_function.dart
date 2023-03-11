



import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PhoneAuthController extends GetxController{

  String userUid = '';
  var varId = '';
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;


  phoneAuth (String phoneNo) async {
    try{
       credentials = null;
       await FirebaseAuth.instance.verifyPhoneNumber(


         phoneNumber: phoneNo,
           timeout: Duration(seconds: 60),


         //what will happend if Verification is Completed

           verificationCompleted: (PhoneAuthCredential credential) async{


             log('completed');

           credentials = credential;

           await FirebaseAuth.instance.signInWithCredential(credential);


           },

           forceResendingToken: resendTokenId,


           // if verification is failed
           verificationFailed: (FirebaseAuthException e){
           log("failed");
           if(e.code == "invalid-phone-number"){
             debugPrint("The provider phone number is not valid.");
           }
           },

           // code sending process
           codeSent:(String verificationId, int? resendToken) async{
            log("code sent");
            varId = verificationId;
            resendTokenId = resendToken;

           },

           // timeout code
           codeAutoRetrievalTimeout: (String verificationId){}

       );
    }catch (e){
      log("Error occured $e");
    }

  }


  //for verifying otp
  verifyOtp (String otpNumber)async{
    log("called");

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: varId, smsCode: otpNumber);
    log("loggedIn");

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

}