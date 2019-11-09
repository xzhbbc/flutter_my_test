import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReduxTextAction { action, changeToEnglishTitle, changeToOtherTitle }

class ReduxTextActionCreator {
  static Action onAction() {
    return const Action(ReduxTextAction.action);
  }
  static Action changeToEnglishTitle() {
    return const Action(ReduxTextAction.changeToEnglishTitle);
  }
  static Action changeToOtherTitle(String title) {
    return Action(ReduxTextAction.changeToOtherTitle, payload: title);
  }
}

// 调用
// dispatch(ReduxTextAction.changeToOtherTitle('Fish Redux'));