import 'package:chat/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mycubite extends Cubit<state>{
  mycubite() : super(init());

  String? emailadd;

  void add(String email){
    emailadd = email;
    emit(addsata());
  }




}