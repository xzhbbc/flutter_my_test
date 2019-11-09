import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReduxTextPagePage extends Page<ReduxTextPageState, Map<String, dynamic>> {
  ReduxTextPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReduxTextPageState>(
                adapter: null,
                slots: <String, Dependent<ReduxTextPageState>>{
                }),
            middleware: <Middleware<ReduxTextPageState>>[
            ],);

}
