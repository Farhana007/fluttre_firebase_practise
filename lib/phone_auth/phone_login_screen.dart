import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'otp_screen.dart';
import 'phone_auth_function.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {




    TextEditingController phoneNum = TextEditingController();
    




    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Welcome to Uber".text.bold.size(25).black.make(),

            30.heightBox,

            Container(

              child: Row(
                 children: [

                   Expanded(
                     flex: 3,
                     child: TextField(
                       controller: phoneNum,
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         hintText: "Enter Your Phone Number",
                         border: InputBorder.none
                       ),

                     ),
                   ),
                 ],
              ),
            ).box.height(60).width(MediaQuery.of(context).size.width*0.9).rounded.shadow.white.make(),
            30.heightBox,
            InkWell(
              onTap: ()async{
                if(phoneNum.text == null){
                  log('Phone NUmber Required');
                }
                await PhoneAuthController().phoneAuth("+880"+phoneNum.text);
                 
                Get.to(()=> OtpScreen());
              },

                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                      child: "Get OTP".text.black.bold.size(20).make()),
                ).box.height(50).width(150).white.rounded.shadow2xl.make(),
              ),

            
          ],
        ),
      ),
    );
  }
}
