import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ReduxTextState state, Dispatch dispatch, ViewService viewService) {
  final ReduxTextState newState = state.clone();
  return Container(
    child: Center(
      child: Text(newState.title),
    ),
  );
}
