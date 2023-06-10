// lib/bloc/app_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'app_event.dart';

class AppBloc extends Bloc<AppEvent, int>{
  AppBloc() : super(0);

  Stream<int> mapEventToState(AppEvent event) async*{
    if (event is SwitchPage){
      yield event.index;
    }
  }
}