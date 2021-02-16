import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';
import 'package:sinaliza_vendas/app/utils/sidebar.dart';
import 'package:sinaliza_vendas/app/utils/sub_sidebar.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  SubSideBar subbar = SubSideBar();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(builder: (_, state) {
      if (state.indexPage == 0) {
        subbar.listSubPageWidgets = subbar.listHomePageWidgets;
      } else if (state.indexPage == 1) {
        subbar.listSubPageWidgets = subbar.listReprePageWidgets;
      } else if (state.indexPage == 2) {
        subbar.listSubPageWidgets = subbar.listContratosPageWidgets;
      } else if (state.indexPage == 3) {
        subbar.listSubPage = subbar.listExpansoesPageWidgets;
      } else if (state.indexPage == 4) {
        subbar.listSubPageWidgets = subbar.listDestaquesPageWidgets;
      }
      if (state.indexSubPage != 0) {
        return Scaffold(
            body: Stack(
          children: [
            subbar.listSubPageWidgets.elementAt(state.indexSubPage),
            SideBar(index: state.indexSubPage),
          ],
        ));
      } else {
        return Scaffold(
            body: Stack(
          children: [
            subbar.listSubPageWidgets.elementAt(0),
            SideBar(index: 0),
          ],
        ));
      }
    });
  }
}
