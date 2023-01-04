import 'package:flutter/material.dart';
import 'package:test_phone_auth/bloc/profile/profile_bloc.dart';


class StoreBlocProvider extends InheritedWidget {
  StoreBlocProvider({Key? key, Widget? child, this.store})
      : super(key: key, child: child!);
  final Store? store;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StoreBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StoreBlocProvider>()!);
  }
}

class Store {
  ProfileBloc profileBloc;

  Store()
      : profileBloc = ProfileBloc();
}
