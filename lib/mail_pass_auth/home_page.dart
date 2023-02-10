import 'package:flutter/material.dart';
import 'package:fluttre_firebase_practise/mail_pass_auth/regscreen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: "Welcome".text.make(),
         centerTitle: true,
         actions: [
            IconButton(
                onPressed: (){
                  Get.to(()=> SignUpScreen());
                },
                icon: Icon(Icons.output,size: 33,
                color: Colors.white,))
         ],
       ),
    );
  }
}
