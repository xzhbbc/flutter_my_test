import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReduxTextComponent extends Component<ReduxTextState> {
  ReduxTextComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReduxTextState>(
                adapter: null,
                slots: <String, Dependent<ReduxTextState>>{
                }),);

}
