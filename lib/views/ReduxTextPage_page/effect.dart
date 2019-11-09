import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReduxTextPageState> buildEffect() {
  return combineEffects(<Object, Effect<ReduxTextPageState>>{
    ReduxTextPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReduxTextPageState> ctx) {
}
