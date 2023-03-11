import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:fluttre_firebase_practise/mv_note_data.dart';
import 'package:fluttre_firebase_practise/firestore_service.dart';

class EditNote extends StatefulWidget {

  NoteModel note;
  EditNote(this.note);


  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();


  @override
  void initState(){
    title.text = widget.note.title;
    description.text = widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "To-Do".text.white.make(),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await FireStoreServices().deleteNote(widget.note.id);
            Get.back();
          },
              icon: Icon(Icons.delete,color: Colors.red,))
        ],
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
                 onTap: ()async{
                   await FireStoreServices().updateNote(widget.note.id, title.text, description.text);
                   Get.back();

                 },
                child: Container(
                  child: "Edit".text.size(25).bold.align(TextAlign.center).black.make(),

                ).box.height(30).width(100).rounded.color(Colors.deepOrange).make(),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
