import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'add_note.dart';
import 'edit_note.dart';
import 'package:fluttre_firebase_practise/mv_note_data.dart';

class ToDoHome extends StatefulWidget {
  //
  // late User user;
  // ToDoHome(this.user);

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "To-Do".text.white.make(),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            onPressed: () {
              Get.to(() => AddNote());
            },
            icon: Icon(Icons.add)),
      ),
      backgroundColor: Colors.white70,
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('notes').snapshots(),
        builder:(context, AsyncSnapshot snapshot){
           if(snapshot.hasData){
             if(snapshot.data.docs.length>0){

               return ListView.builder(
                 itemCount: snapshot.data.docs.length,
                     itemBuilder:(context ,index){
                             NoteModel note = NoteModel.fromJson(snapshot.data.docs[index]);
                             return Card(
                               elevation: 5,
                               child: ListTile(
                                 title: note.title.text.make(),
                                 subtitle: note.description
                                     .text
                                     .overflow(TextOverflow.ellipsis)
                                     .maxLines(2)
                                     .make(),
                                 onTap: () {
                                   Get.to(() => EditNote(note));
                                 },
                               ),
                             );
                     },
               );

             } else{
               return Center(
                 child:"No Noted Available".text.make(),
               );
             }
           }
           return Center(
             child: CircularProgressIndicator(),
           );
        },
      )
    );
  }
}

