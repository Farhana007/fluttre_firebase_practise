import 'package:flutter/material.dart';
import 'package:fluttre_firebase_practise/mail_pass_auth/regscreen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../to_do_app/to_do_home.dart';


class HomePage extends StatelessWidget {




  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: "Welcome".text.make(),
         centerTitle: true,
         actions: [
            IconButton(
                onPressed: (){
                  Get.to(()=> ToDoHome());
                },
                icon: Icon(Icons.output,size: 33,
                color: Colors.white,))
         ],
       ),
      body: Container(
         width: MediaQuery.of(context).size.width,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,

           children: [

             //add data in Firestore
             ElevatedButton(
                 onPressed: ()async{

                   CollectionReference users = firestore.collection('users');

                   // await users.add({
                   //   'name':'rahul'
                   // });
                   //


                   // if we want to set the ID from Ourself
                   await users.doc("fluttte112").set({
                     'name':'preeti'
                   }) ;


                 },
                 child: Text("Add data to Firestore")),


             //read data from firestore
             ElevatedButton(

                 onPressed: ()async{
                    CollectionReference users = firestore.collection('users');

                    //to read the All documents from collection
                     QuerySnapshot allResult = await users.get();

                     allResult.docs.forEach((DocumentSnapshot result) {
                       print(result.data());
                     });

                     //for read the targeted Id  collection

                    DocumentSnapshot onlYresult = await users.doc('fluttte112').get();
                    print(onlYresult.data());

                    //Realtime Data read
                   //
                   // users.doc("fluttte112").snapshots().listen((result) {
                   //   print(result.data());
                   // });



                 },

                 child:Text("Read data from Firestore")),


              //update data in firestore

              ElevatedButton(
                  onPressed: ()async{

                   await firestore.collection('users').doc('fluttte112').update({
                     'name' : 'Siddart'
                   });

                  },

                  child: Text("Update the Firestore")),


             // delete data in firestore

             ElevatedButton(

                 onPressed: ()async{

                   await firestore.collection('users').doc('fluttte112').delete();

                 },
                 child: Text("Delete data from Firestore"))
           ],
         ),
      ),
    );
  }
}
