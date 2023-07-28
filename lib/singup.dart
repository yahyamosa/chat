import 'package:chat/chatpage.dart';
import 'package:chat/cubit/mycuibte.dart';
import 'package:chat/cubit/state.dart';
import 'package:chat/login.dart';
import 'package:chat/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}
String? email ;
String? password ;
class _singupState extends State<singup> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<mycubite , state>(builder:(context , state){
      return Scaffold(
        appBar: AppBar(
          title: Text("app"),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("login",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (data) {
                  password= data ;
                },
                decoration: InputDecoration(
                    label: Text('password' ,),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.videocam_off_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (data){
                  email = data ;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text('email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: ()async{
                    try{
                      var auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(email: email!, password: password!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("success")));
                      BlocProvider.of<mycubite>(context).add(email!);
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>chatpage()));
                    }
                    catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${e.toString()}")));
                    }
                  } ,
                  child: Text("LOGIN"),

                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  Text("forgetpassword?"),
                  TextButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>login()));
                  }, child:Text('now'))
                ],
              )
            ],
          ),
        ),
      );
    }, listener:(context , state){});
  }
}
