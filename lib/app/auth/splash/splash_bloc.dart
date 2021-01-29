import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:sinaliza_vendas/app/auth/login/login_page.dart';
import 'package:sinaliza_vendas/app/modules/base/base.dart';
import 'package:sinaliza_vendas/app/repositories/splash_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState());
  SplashRepository repository = SplashRepository();
  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    var result = await repository.getAutenticacao();
    if (result != null) {
      Get.off(Base());
    } else {
      Get.off(LoginPage());
    }
  }
}
