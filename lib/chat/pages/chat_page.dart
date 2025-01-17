// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// hex color
import 'package:hexcolor/hexcolor.dart';
// chat clipper
import 'package:custom_clippers/custom_clippers.dart';
import 'chat_home_page.dart';

class ChatPage extends StatefulWidget {


  ChatPage({Key? key, }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
    var arrMessages=[{"from":1,"message":"hello"},{"from":2,"message":"hi"},{"from":2,"message":"hi"},{"from":1,"message":"yoo"},{"from":2,"message":"how are  you doing"},{"from":1,"message":"i'm fine thanks what about you how is it going so far"},{"from":2,"message":"me too fine thanks what about you how is it going so far"}];

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [HexColor('#675975'), HexColor('#7b94c4')]),
          ),
        ),
        title: Row(children: [
          IconButton(onPressed: ()=>{
            Navigator.push( context,
                                MaterialPageRoute(
                                    builder: (context) => ChatHome())
                                    )
                                
          }, icon:Icon(Icons.arrow_back)
          ),
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset(
                  'images/profile1.jpg',
                  height: 45,
                  width: 45,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'User',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
      
      ),
      // body
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
        children: [
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
         for (var conv=0;conv<arrMessages.length; conv++)
         Column(       
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     arrMessages[conv]["from"]==1?  Padding(
        padding: EdgeInsets.only(right: 80),
        child: ClipPath(
          clipper:UpperNipMessageClipper(MessageType.receive),
          child:Container(
            padding:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFE1E1E2),
            ),
           
            child: 
                
                 Text(arrMessages[conv]["message"].toString(),
            style: TextStyle(fontSize: 16),),
          ) ,
        ),
        ):
      Container(
        alignment:Alignment.centerRight ,
        child: Padding(padding: EdgeInsets.only(top: 20, left: 200),
          child: ClipPath(
            clipper:UpperNipMessageClipper(MessageType.send),
            child:Container(
              padding:  EdgeInsets.only(left: 20,top:10,bottom: 25,right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 23, 54, 84), 
               
              ),
              child:Text(arrMessages[conv]["message"].toString(),
              style: TextStyle(fontSize:  16,color: Colors.white),)
            ) ,
          ),
          ),
      ),


      ],      
   )]),
        ],
      ),
      // botttom chat
      bottomSheet:Container(
      height: 65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 3),
        )
      ]),
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(children: [
        
       
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.centerRight,
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Type Something",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () => {print('pressed')},
          padding: EdgeInsets.only(right: 10),
          icon: Icon(
            Icons.send,
            color: Color.fromARGB(255, 148, 98, 195),
            size: 30,
          ),
        )
      ]),
    ),
    );
  }
}
