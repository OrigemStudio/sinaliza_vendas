import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/app.dart';
import 'package:sinaliza_vendas/app/modules/clientes/add/add_bloc.dart';
import 'package:sinaliza_vendas/app/repositories/clientes_repository.dart';
import 'auth/login/login_bloc.dart';
import 'auth/register/register_bloc.dart';
import 'auth/splash/splash_bloc.dart';
import 'modules/base/bloc/base_bloc.dart';
import 'modules/clientes/bloc/clientes_bloc.dart';

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BaseBloc>(
            create: (BuildContext context) => BaseBloc(),
          ),
          BlocProvider<RegisterBloc>(
              create: (BuildContext context) => RegisterBloc()),
          BlocProvider<LoginBloc>(
              create: (BuildContext context) => LoginBloc()),
          BlocProvider<SplashBloc>(
            create: (BuildContext context) => SplashBloc(),
          ),
          BlocProvider<ClientesBloc>(
            create: (BuildContext context) => ClientesBloc(),
          ),
          BlocProvider<AddBloc>(
            create: (BuildContext context) => AddBloc(),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ClientesRepository>(
              create: (context) => ClientesRepository(),
            ),
          ],
          child: MyApp(),
        ));
  }
}
