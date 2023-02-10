



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFunction {


  FirebaseAuth  firebaseAuth = FirebaseAuth.instance;

  // Signup a User


  Future<User?> signUpUser (String email, String password, BuildContext context)async{

 try{
   UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
   return userCredential.user;
 } on FirebaseAuthException catch(e){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
 }catch(e){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some thing went wrong"),backgroundColor: Colors.red,));
 }



  }




 // Login A user


  Future<User?> loginUser (String email, String password, BuildContext context)async{

    try{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some thing went wrong"),backgroundColor: Colors.red,));
    }

  }


  //Google Signing



    Future <User?> signInWithGoogle (context) async{

    try{

      // trigger the Authentication dialog

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser != null){
        // obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        // create new Credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        //once signed in return the user data to firebase
        UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

        return userCredential.user;
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some thing went wrong"),backgroundColor: Colors.red,));
    }

    }




}