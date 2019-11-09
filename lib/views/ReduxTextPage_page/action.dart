import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReduxTextPageAction { action }

class ReduxTextPageActionCreator {
  static Action onAction() {
    return const Action(ReduxTextPageAction.action);
  }
}
