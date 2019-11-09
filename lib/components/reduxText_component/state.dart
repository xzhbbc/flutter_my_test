import 'package:fish_redux/fish_redux.dart';

class ReduxTextState implements Cloneable<ReduxTextState> {
  String title;
  @override
  ReduxTextState clone() {
    return ReduxTextState()..title = title;
  }
}

ReduxTextState initState(Map<String, dynamic> args) {
  return ReduxTextState();
}
