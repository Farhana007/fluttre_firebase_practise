import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:velocity_x/velocity_x.dart';
import '../mail_pass_auth/home_page.dart';
import 'phone_auth_function.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';





class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {





  TextEditingController otpCtlr = TextEditingController();



    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
               controller: otpCtlr,
               decoration: InputDecoration(
                 hintText: "Enter Your OTP"
               ),
             ),
           50.heightBox,

           GestureDetector(
             onTap: ()async{
               Get.to(()=> HomePage());
        await PhoneAuthController().verifyOtp(otpCtlr.text);

               Get.to(()=> HomePage());




             },
             child: Container(
      child: Align(
      alignment: Alignment.center,
              child: "Verify".text.black.bold.size(20).make()),
    ).box.height(50).width(150).white.rounded.shadow2xl.make(),
           ),

          ],
        ),
      )
    );
  }
}

