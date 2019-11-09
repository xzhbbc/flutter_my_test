import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReduxTextPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReduxTextPageState>>{
      ReduxTextPageAction.action: _onAction,
    },
  );
}

ReduxTextPageState _onAction(ReduxTextPageState state, Action action) {
  final ReduxTextPageState newState = state.clone();
  return newState;
}
