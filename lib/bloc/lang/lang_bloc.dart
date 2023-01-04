import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangBloc  {
  late BehaviorSubject<String?> _localStateChangedControllers;
  late Stream<String?> _local;

  LangBloc() {
    _localStateChangedControllers = BehaviorSubject<String>();
    _local = _localStateChangedControllers.stream;
    _init();
  }

  _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _localStateChangedControllers.add(prefs.getString("LOCAL") ?? "en");
  }

  Future<void> setLocal(String local) async {
    _localStateChangedControllers.add(local);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("LOCAL", local);
  }

  Stream<String?> get local => _local;
}
