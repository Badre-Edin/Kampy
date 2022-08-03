import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'kampy_login.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
 const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
  
}

class _SignUpState extends State<SignUp> {
   // decalare email and password and name
   final TextEditingController emailController =TextEditingController();
    final TextEditingController passwordController =TextEditingController();
      final TextEditingController nameController =TextEditingController();
      // image picker
  File? _photo;

  final ImagePicker _picker = ImagePicker();
// get image from galerry
  Future  imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
// get image from gallery
Future getFromCamera() async {
     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
}
  @override
  
  Widget build(BuildContext context) {

final scaffoldState = GlobalKey<ScaffoldState>();

    double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;



    return Scaffold(
              key: scaffoldState,

        backgroundColor: Colors.transparent, 
     
      body:
      Stack(

        children: <Widget>[
          Container(
              
            decoration: const BoxDecoration(
              image:  DecorationImage(
              image:  AssetImage("images/background5.jpg"),
             fit: BoxFit.fill,
           )),
          ),
      
      
       SingleChildScrollView(
        
            
               

        
child: Stack(
        children:<Widget> [
         
    // sign up container
            Container(
                        decoration: BoxDecoration(
                        color:const  Color.fromARGB(0, 224, 224, 228),
                        borderRadius: BorderRadius.circular(120),
                     
                      ),
              margin:  const EdgeInsets.only(left: 20,right: 20,top: 70),
             

             width: w,
// child sign up
              child:Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,

                children:  <Widget>[
                  // sign up title
                  Container(
        padding: const EdgeInsets.only(left: 120 ),
           child: Row( 
            children: const <Widget> [
            Text( 
           "Sign Up",
            style: TextStyle(
              color: Color.fromARGB(255, 14, 14, 14),
               fontWeight: FontWeight.bold,
              fontSize: 30,
            ), 
            
          )
          
            ],
       
          )
        
          
          ),
                   
          const SizedBox(  height: 10,),
         
              //  Container(
              //       child: Image.file(
              //         _photo!,
              //         fit: BoxFit.contain,
              //       ),),
               
// image pickler

             imageProfile(),
         

                    // first input
               Container(
              margin:   const EdgeInsets.only(top:10,right:20,left:20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(151, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                        BoxShadow(
                              blurRadius: 15,
                           offset: Offset(1, 1),
                              color: Color.fromARGB(75, 198, 202, 218),
                        )]
                      ),
                     child:TextField(
                      controller: nameController,
                      decoration: InputDecoration(      
                        hintText: "Name", 
                   prefixIcon:const Icon(Icons.account_circle,color:Color.fromARGB(255, 132, 31, 120)) ,         

                        focusedBorder: const OutlineInputBorder(
                     
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                                            

                        )
                       ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(

                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                       ),
                       
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          
                        )
                      ),
                     )  
             ),
            //  second input
             
            Container(
              width: 300,
              margin:   const EdgeInsets.only(top:20,right:20,left:20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(151, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                        BoxShadow(
                              blurRadius: 15,
                           offset: Offset(1, 1),
                              color: Color.fromARGB(75, 198, 202, 218),
                        )]
                      ),
                     child:TextField(
                     controller: emailController,
                      decoration: InputDecoration(   
                           hintText: "Email",  
                       prefixIcon:const Icon(Icons.email,color:Color.fromARGB(255, 132, 31, 120)) ,         
               
                        focusedBorder: const OutlineInputBorder(
                     
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                       ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(

                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                       ),
                       
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          
                        )
                      ),
                     )  
             ),
            //  third input
           Container(
            width: 300,
              margin:   const EdgeInsets.only(top:20,right:20,left:20,bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(151, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                        BoxShadow(
                              blurRadius: 15,
                           offset: Offset(1, 1),
                              color: Color.fromARGB(75, 198, 202, 218),
                        )]
                      ),
                     child:TextField(
                     controller: passwordController,
                     obscureText: true,
                      decoration: InputDecoration(  
                           hintText: "Password",      
                        prefixIcon:const Icon(Icons.password,color:Color.fromARGB(255, 132, 31, 120)) ,         
            
                        focusedBorder: const OutlineInputBorder(
                     
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                       ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(

                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                       ),
                       
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          
                        )
                      ),
                     )  
             ),
           

 // button container
GestureDetector(
        onTap: () async {
     AuthController.instance.register(emailController.text.trim(), passwordController.text.trim(),nameController.text.trim());
       
          },
          child: Container(
          margin:  const EdgeInsets.only(left: 20,right: 20,bottom: 20),

            width: 150,
            height: 60,
            
           decoration: const BoxDecoration(
                borderRadius:   BorderRadius.only(
               bottomLeft:  Radius.circular(700.0),
                bottomRight:  Radius.circular(700.0),
                topLeft:  Radius.circular(700.0),
                topRight:  Radius.circular(700.0),
              ),

           color: Color.fromARGB(255, 33, 1, 34),
            
              
          ), child: const Center(
          child : Text(
            "Sign Up",
                    textAlign: TextAlign.center,
                       style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      
                       )
                       ),),
          ),),


          // log in 
          GestureDetector(
 
     child: Container(
      
        padding: const EdgeInsets.only(left: 60,bottom: 40),
           child: Row( 
            children:const <Widget> [
            Text( 
           "Have an account?",
            style: TextStyle(
              color: Color.fromARGB(255, 14, 14, 14),
              fontSize: 20,
            ), 
            
          ),
              Text( 
        
           " Log in",
            style:  TextStyle(
              color: Color.fromARGB(255, 25, 26, 25),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ), 
            
            
          ),
          
            ],
       
          )
        
          
          )
,onTap: () { 
          Navigator.push(
              context,
         MaterialPageRoute(builder: (context) => LogIn()),
                );
              },),
            


             
                ],
              ),
            ),
       
  
       
       
        ],),),],
        
    
 
               
                
                 
    ));
    
  }



// image picker function
  Widget imageProfile(){

      return Center(
       child: Stack(
        children: <Widget> [
          //   const CircleAvatar(
          //   radius: 50,
          //   backgroundImage:
           
          //   AssetImage("images/profile1.jpg") 


          
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: CircleAvatar(
                child: _photo == null
                    ? Text("No Image is picked")
                    : Image.file(_photo!),
              ),
            ),
          ),
          Positioned(
            bottom:0,
            right: 10.0,
            child:InkWell(
              // direct user to add image
              onTap: (){
               showModalBottomSheet<void>(
       
            context: context,
            builder: (BuildContext context) {
        
              return SizedBox(
                height: 200,
               child: Column(
      children: <Widget>[
        const Text(
          "choose Profile photo",
          style:  TextStyle(
            fontSize: 20.0,
          ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                // take photo from the camera
              TextButton.icon(
                icon: const Icon(Icons.camera),
             onPressed: (){
          getFromCamera();
              },
              label: const Text("Camera"),

              ),
            // Get photo from Gallery
               TextButton.icon(
               
                
            icon: const Icon(Icons.image),
             onPressed: (){
                     imgFromGallery(); 
                     
                     print(_photo.toString());  
              },
              label: const Text("Galerry"),

             )
            ],),
      ]
    ),
              );
            },
          );
              },
            child:const Icon(Icons.camera_alt,
            color: Color.fromARGB(255, 28, 3, 33),
            size: 25.0,
       )  ) )
        ]
      )
      );
    }


}