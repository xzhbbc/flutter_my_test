import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReduxTextState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReduxTextState>>{
      ReduxTextAction.action: _onAction,
      ReduxTextAction.changeToEnglishTitle: _onAction,
      ReduxTextAction.changeToOtherTitle: _onAction,
    },
  );
}

ReduxTextState _onAction(ReduxTextState state, Action action) {
  final ReduxTextState newState = state.clone();
  switch (action.type) {
    case ReduxTextAction.changeToEnglishTitle:
      newState.title = 'Title';
      break;
    case ReduxTextAction.changeToOtherTitle:
      newState.title = action.payload;	// 使用参数
      break;
  }
  return newState;
}