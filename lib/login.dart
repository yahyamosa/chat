import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
String? email ;
String? password ;
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("singup",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
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
                  await auth.createUserWithEmailAndPassword(email:email!, password: password!);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("success")));
                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${e.toString()}")));
                  }
                } ,
                child: Text("sign up"),

              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Text("forgetpassword?"),
                TextButton(onPressed:(){
                }, child:Text('now'))
              ],
            )
          ],
        ),
      ),
    );

  }
}
