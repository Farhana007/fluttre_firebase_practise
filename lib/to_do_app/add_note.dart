import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:fluttre_firebase_practise/firestore_service.dart';

class AddNote extends StatefulWidget {

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {


   TextEditingController title = TextEditingController();
   TextEditingController description = TextEditingController();
   bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "To-Do".text.white.make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [

              "Title".text.size(25).bold.make(),
              20.heightBox,
              TextField(
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                  )
                ),
              ),

              40.heightBox,

              "Description".text.size(25).bold.make(),
              20.heightBox,
              TextField(
                controller: description,
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(


                    border: OutlineInputBorder(

                    ),

                ),
              ),

              50.heightBox,



              GestureDetector(

                onTap:()async{
                   await FireStoreServices().insertNote(title.text, description.text);
                   Get.back();
              },
                child: Container(
                  child: "Add".text.size(25).bold.align(TextAlign.center).black.make(),

                ).box.height(30).width(100).rounded.color(Colors.deepOrange).make(),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
