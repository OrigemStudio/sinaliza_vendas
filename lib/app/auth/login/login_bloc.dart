import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/modules/base/base.dart';
import 'package:sinaliza_vendas/app/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(loading: false, result: false));
  LoginRepository repository = LoginRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield LoginState(loading: true);
    var erro = await repository.testeFields(event.email, event.senha);
    if (erro == 'ok') {
      var user = await repository.register(event.email, event.senha);
      if (user != '') {
        yield LoginState(loading: false, result: true);
        Get.off(Base());
      }
    } else {
      print(erro);
      yield LoginState(loading: false);
    }
  }
}
