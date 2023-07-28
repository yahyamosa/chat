

import 'package:chat/cubit/mycuibte.dart';
import 'package:chat/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

class chatpage extends StatefulWidget {
  //final String email ;
   chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();

}
class _chatpageState extends State<chatpage> {

  @override
  CollectionReference messege = FirebaseFirestore.instance.collection('users');
  TextEditingController text = TextEditingController();
  final listcont = ScrollController();
  Widget build(BuildContext context) {
    List<messeg> messegList  = [];
    return BlocConsumer<mycubite,state>(
        builder:(context , state){
          return StreamBuilder<QuerySnapshot>(
              stream: messege.orderBy("time", descending: true).snapshots(),
              builder:(context , snapshot){
                if(snapshot.hasData){
                  for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
                    messegList.add(messeg.fromjson(snapshot.data!.docs[i]));
                  }
                  return  Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: Text("chat"),
                        centerTitle: true,
                      ),
                      body: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                               reverse: true,
                                controller: listcont,
                                itemBuilder: (context, index) {
                                return messegList[index].email == BlocProvider.of<mycubite>(context).emailadd ?
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 30, right: 30),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(30),
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                          color: Colors.blue
                                      ),
                                      child: Text("${messegList[index].messegd}"),
                                    ),
                                  ),
                                ) :
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 30, right: 30),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30),
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                          color: Colors.amberAccent
                                      ),
                                      child: Text("${messegList[index].messegd}"),
                                    ),
                                  ),
                                ) ;
                              },
                                itemCount: messegList.length,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              onFieldSubmitted: (data) {
                                messege.add({
                                  "messeg": data,
                                  "time": DateTime.now(),
                                  "id": BlocProvider.of<mycubite>(context).emailadd
                                });
                                text.clear;

                                listcont.animateTo
                                  ( 0,
                                    duration:Duration(seconds: 1),
                                    curve:Curves.fastOutSlowIn);
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.send),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                            ),
                          )
                        ],
                      )
                  );
                }
                else{
                  return Text("welcom");
                  //throw Exception("rr");
                }

              }
          );
        },
        listener:(context,state){});
  }
}


//Scaffold(
//                 appBar: AppBar(
//                   automaticallyImplyLeading: false,
//                   title: Text("chat"),
//                   centerTitle: true,
//                 ),
//                 body: Column(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListView.builder(itemBuilder: (context, index) {
//                           return Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 padding: EdgeInsets.only(
//                                     top: 20, bottom: 20, left: 30, right: 30),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(30),
//                                         topLeft: Radius.circular(30),
//                                         topRight: Radius.circular(30)),
//                                     color: Colors.blue
//                                 ),
//                                 child: Text("${messegList[index].messegd}"),
//                               ),
//                             ),
//                           );
//                         }, itemCount: 30,),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8, right: 8),
//                       child: TextFormField(
//                         onFieldSubmitted: (data) {
//                           messege.add({
//                             "messeg": data,
//                             "time": DateTime.now(),
//                             "id": BlocProvider.of<mycubite>(context).emailadd
//                           });
//                         },
//                         decoration: InputDecoration(
//                             suffixIcon: IconButton(
//                               onPressed: () {}, icon: Icon(Icons.send),),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8)
//                             )
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//             )