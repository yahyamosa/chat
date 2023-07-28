import 'package:chat/cubit/mycuibte.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/singup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chat());
}
class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>mycubite(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:singup()
      ),
    );
  }
}
