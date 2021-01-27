import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/models/page_model.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_event.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';

class SideBar extends StatefulWidget {
  final int index;

  const SideBar({Key key, this.index}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<PageModel> listPages = [
    PageModel('Home', Icons.home),
    PageModel('Clientes', Icons.person),
    PageModel('Perfil', Icons.person),
  ];
  bool isOpen = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: (isOpen) ? drawerOpen() : drawerClose());
  }

  Widget drawerOpen() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), topRight: Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            pages(),
            close()
          ],
        ),
      ),
    );
  }

  Widget pages() {
    return Wrap(
      children: [
        BlocBuilder<BaseBloc, BaseState>(builder: (_, state) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: listPages.length,
              itemBuilder: (_, i) {
                Color iconColor =
                    (state.currentPage == i) ? Colors.black : Colors.white;
                Color letraColor =
                    (state.currentPage == i) ? Colors.black : Colors.white;
                Color fundoColor = (state.currentPage == i)
                    ? Colors.purpleAccent
                    : Colors.purple;
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<BaseBloc>(context)
                        .add(UpdateEvent(value: i));
                  },
                  child: page(listPages[i].page, listPages[i].icon, iconColor,
                      letraColor, fundoColor),
                );
              });
        }),
      ],
    );
  }

  Widget page(String page, IconData icon, Color iconColor, Color letraColor,
      Color fundoColor) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
            color: fundoColor, borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            Text(page, style: TextStyle(color: letraColor, fontSize: 12))
          ],
        ),
      ),
    );
  }

  Widget drawerClose() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12))),
          height: 40,
          width: 40,
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget close() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = false;
          });
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(4)),
          child: Icon(Icons.close, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
