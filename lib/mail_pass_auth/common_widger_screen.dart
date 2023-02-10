import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

Widget custorTextField({String? title, hint,controller}){
   return   Padding(
     padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
     child: Container(

       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           title!.text.bold.size(15).make(),
           5.heightBox,
           Container(

             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 controller: controller,

                 decoration: InputDecoration.collapsed(
                   hintText:hint,
                   hintStyle:TextStyle(
                     color: Colors.white,

                   ) ,

                 ),
               ),
             ),


           ).box.color(Colors.blue).width(300).height(50).rounded.make(),
         ],
       ),
     ),
   );

}


