import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';

import 'base_event.dart';

enum EventStatus { update }

class BaseBloc extends Bloc<UpdateEvent, BaseState> {
  BaseBloc() : super(BaseState(currentPage: 0));

  @override
  Stream<BaseState> mapEventToState(UpdateEvent event) async* {
    yield BaseState(currentPage: event.value);
  }
}
