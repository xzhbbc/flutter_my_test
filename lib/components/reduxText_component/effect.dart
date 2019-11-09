import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReduxTextState> buildEffect() {
  return combineEffects(<Object, Effect<ReduxTextState>>{
    ReduxTextAction.action: _onAction,
  });
}

void _getTile(Action action, Context<ReduxTextState> context) {
  String title = 'test fish';
  context.dispatch(ReduxTextActionCreator.changeToOtherTitle(title));
}

void _onAction(Action action, Context<ReduxTextState> ctx) {
}
