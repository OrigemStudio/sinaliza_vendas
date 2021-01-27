import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';
import 'package:sinaliza_vendas/app/modules/clientes/clientes_page.dart';
import 'package:sinaliza_vendas/app/modules/home/home_page.dart';
import 'package:sinaliza_vendas/app/modules/perfil/perfil_page.dart';
import 'package:sinaliza_vendas/app/utils/sidebar.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  List widgetOptions = [HomePage(), ClientesPage(), PerfilPage()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(builder: (_, state) {
      if (state.currentPage != 0) {
        return Scaffold(
            body: Stack(
          children: [
            widgetOptions.elementAt(state.currentPage),
            SideBar(index: state.currentPage),
          ],
        ));
      } else {
        return Scaffold(
            body: Stack(
          children: [
            widgetOptions.elementAt(0),
            SideBar(index: 0),
          ],
        ));
      }
    });
  }
}
