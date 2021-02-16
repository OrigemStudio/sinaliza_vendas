import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';

import 'base_event.dart';

enum EventStatus { update }

class BaseBloc extends Bloc<BlocEvent, BaseState> {
  BaseBloc() : super(BaseState(indexPage: 0, indexSubPage: 0));

  @override
  Stream<BaseState> mapEventToState(BlocEvent event) async* {
    if (event is UpdatePage) {
      yield BaseState(indexPage: event.indexPage, indexSubPage: 0);
    } else if (event is UpdateSubPage) {
      yield BaseState(
          indexPage: state.indexPage, indexSubPage: event.indexSubPage);
    }
  }
}
