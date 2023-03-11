import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'auth_screen.dart';
import 'common_widger_screen.dart';
import 'home_page.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();

  bool loading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: "SIGN UP"
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
                Container(
                  child: custorTextField(
                    title: "Password",
                    hint: "Confirm Your Password",
                    controller: _confirmpasswordcontroller,
                  ),
                ),
                30.heightBox,
                loading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });

                          if (_emailcontroller.text == '' ||
                              _passwordcontroller.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("All Field Reqired")));
                          } else if (_passwordcontroller.text !=
                              _confirmpasswordcontroller.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Password Not Matched")));
                          } else {
                            User? register = await AuthFunction().signUpUser(
                                _emailcontroller.text,
                                _passwordcontroller.text,
                                context);
                            if (register != null) {
                              Get.to(() => HomePage());
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: "Signup"
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
                    Get.to(() => LoginScreen());
                  },
                  child: "Already Have Account? Login".text.make(),
                ),
                20.heightBox,
                Divider(
                  thickness: 2,
                ),
                loading
                    ? CircularProgressIndicator()
                    : SignInButton(Buttons.GoogleDark,
                        text: "Continue with Google", onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await AuthFunction().signInWithGoogle(context);

                        setState(() {
                          loading = false;
                        });

                        Get.to(() => HomePage());
                      })
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
      ),
    );
  }
}
