
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttre_firebase_practise/mail_pass_auth/auth_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mail_pass_auth/home_page.dart';
import 'mail_pass_auth/login_screen.dart';
import 'mail_pass_auth/regscreen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StreamBuilder(


         stream: AuthFunction().firebaseAuth.authStateChanges(),

          builder:(context,snapshot){
             if(snapshot.hasData){
               return HomePage();
             }
             return SignUpScreen();
      })

    );
  }
}
