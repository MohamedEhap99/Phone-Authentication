import 'package:flutter/material.dart';
import 'package:test_phone_auth/bloc/auth/phone_auth/phone_auth_bloc.dart';

class AuthBlocProvider extends InheritedWidget {
  final bloc;

  AuthBlocProvider({Key? key, Widget? child, this.bloc})
      : super(key: key, child: child!);

  @override
  bool updateShouldNotify(_) => true;

  static PhoneAuthBloc of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<AuthBlocProvider>()!)
        .bloc;
  }
}
