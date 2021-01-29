import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/auth/splash/splash_page.dart';
import 'package:sinaliza_vendas/app/repositories/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(loading: false, result: false));
  RegisterReposotory repository = RegisterReposotory();
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterState(loading: true);
    var erro = await repository.testeFields(event.email, event.senha);
    if (erro == 'ok') {
      var user = await repository.register(event.email, event.senha);
      if (user != '') {
        yield RegisterState(loading: false, result: true);
        Get.off(SplashPage());
      }
    } else {
      print(erro);
      yield RegisterState(loading: false);
    }
  }
}
