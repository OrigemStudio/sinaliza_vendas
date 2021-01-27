import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/base.dart';

import 'modules/base/bloc/base_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BaseBloc>(
          create: (BuildContext context) => BaseBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Sinaliza Vendas',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Base(),
      ),
    );
  }
}
