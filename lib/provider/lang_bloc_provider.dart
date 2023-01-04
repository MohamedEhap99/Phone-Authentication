import 'package:flutter/material.dart';
import 'package:test_phone_auth/bloc/lang/lang_bloc.dart';

class LangBlocProvider extends InheritedWidget{
  final bloc;

  LangBlocProvider({Key? key, Widget? child, this.bloc}) : super(key: key, child: child!);

  bool updateShouldNotify(_) => true;

  static LangBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LangBlocProvider>()!).bloc;
  }
}