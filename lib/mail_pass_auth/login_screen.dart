import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:get/get.dart';

import '../phone_auth/phone_login_screen.dart';
import 'auth_screen.dart';
import 'common_widger_screen.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

   bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: "LOGIN"
                    .text
                    .black
                    .bold
                    .size(20)
                    .align(TextAlign.left)
                    .make(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: custorTextField(
                    title: "E-mail",
                    hint: "Enter Your E-mail",
                    controller: _emailcontroller,
                  ),
                ),
              ),
              Container(
                child: custorTextField(
                  title: "Password",
                  hint: "Enter Your Password",
                  controller: _passwordcontroller,
                ),
              ),
              30.heightBox,
             loading? CircularProgressIndicator(): GestureDetector(
                onTap: () async {

                  setState(() {
                    loading = true;
                  });
                  if (_emailcontroller.text == '' ||
                      _passwordcontroller.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("All Field Reqired")));
                  } else {
                    User? register = await AuthFunction().loginUser(
                        _emailcontroller.text,
                        _passwordcontroller.text,
                        context);

                    if(register != null){
                      Get.to(()=> HomePage());

                    }

                  }
                  setState(() {
                    loading = false;
                  });
                },
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: "LOGIN"
                        .text
                        .white
                        .bold
                        .size(20)
                        .align(TextAlign.left)
                        .make(),
                  ),
                )
                    .box
                    .height(40)
                    .width(230)
                    .color(Colors.red)
                    .shadow2xl
                    .rounded
                    .make(),
              ),
              20.heightBox,
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: "Don't Have Account? Sign up".text.make(),
              ),

              30.heightBox,

        InkWell(
          onTap: (){
            Get.to(()=> LogInScreen());
          },
           child: Container(
            child: Align(
              alignment: Alignment.center,
              child: "PHONE LOGIN"
                  .text
                  .white
                  .bold
                  .size(20)
                  .align(TextAlign.left)
                  .make(),
            ),
        )
              .box
              .height(40)
              .width(230)
              .color(Colors.red)
              .shadow2xl
              .rounded
              .make(),
         ),

            ],
          ),
        )
            .box
            .height(MediaQuery.of(context).size.height * 0.7)
            .width(MediaQuery.of(context).size.width * 0.8)
            .rounded
            .white
            .shadow
            .make(),
      ),
    );
  }
}
