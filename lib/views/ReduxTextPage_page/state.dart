import 'package:fish_redux/fish_redux.dart';

class ReduxTextPageState implements Cloneable<ReduxTextPageState> {

  @override
  ReduxTextPageState clone() {
    return ReduxTextPageState();
  }
}

ReduxTextPageState initState(Map<String, dynamic> args) {
  return ReduxTextPageState();
}
