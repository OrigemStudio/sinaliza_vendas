import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sinaliza_vendas/app/models/page_model.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_bloc.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_event.dart';
import 'package:sinaliza_vendas/app/modules/base/bloc/base_state.dart';
import 'package:sinaliza_vendas/app/utils/sub_sidebar.dart';

class SideBar extends StatefulWidget {
  final int index;

  const SideBar({Key key, this.index}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<PageModel> listPages = [
    PageModel('Área do Representante', Icons.home),
    PageModel('Representantes', Icons.people),
    PageModel('Contratos e Vendas', Icons.folder),
    PageModel('Expansões', Icons.public),
    PageModel('Destaques do Mês', Icons.mood)
  ];
  bool isOpen = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: (isOpen) ? drawerOpen() : drawerClose());
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
                    (state.indexPage == i) ? Colors.blue : Colors.white;
                Color letraColor =
                    (state.indexPage == i) ? Colors.white : Colors.white;
                Color fundoColor =
                    (state.indexPage == i) ? Color(0xff6C0087) : Colors.purple;
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<BaseBloc>(context)
                        .add(UpdatePage(indexPage: i));
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
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .005),
      child: Container(
        color: fundoColor,
        height: 50,
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .004,
                      left: MediaQuery.of(context).size.width * .008),
                  child: Icon(icon, color: iconColor)),
            ),
            isOpen
                ? Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * .008,
                        left: MediaQuery.of(context).size.width * .005),
                    child: Center(
                        child: Text(page,
                            style: TextStyle(color: letraColor, fontSize: 16))))
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget drawerOpen() {
    return Row(
      children: [
        Container(
          height: double.infinity,
          width: 230,
          decoration: BoxDecoration(
            color: Colors.purple,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01,
                        ),
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * .005,
                        ),
                        child: Image.asset('assets/sinaliza_notification.png')),
                    Text('Sinaliza Vendas',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * .003,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .012,
                    bottom: MediaQuery.of(context).size.width * .012,
                    left: MediaQuery.of(context).size.width * .002,
                    right: MediaQuery.of(context).size.width * .002),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .004,
                    left: MediaQuery.of(context).size.width * .002,
                    right: MediaQuery.of(context).size.width * .002),
              ),
              Expanded(
                flex: 90,
                child: Align(alignment: Alignment.topCenter, child: pages()),
              ),
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * .003,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .012,
                    bottom: MediaQuery.of(context).size.width * .012,
                    left: MediaQuery.of(context).size.width * .002,
                    right: MediaQuery.of(context).size.width * .002),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .004,
                    left: MediaQuery.of(context).size.width * .002,
                    right: MediaQuery.of(context).size.width * .002),
              ),
              Expanded(
                flex: 10,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .005,
                          bottom: MediaQuery.of(context).size.height * .02),
                      child: buttomClose(),
                    )),
              )
            ],
          ),
        ),
        Container(
          height: double.infinity,
          width: 200,
          decoration: BoxDecoration(
            color: Color(0xff352238),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(6, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .01,
                    left: MediaQuery.of(context).size.width * .005),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '15/02/2023',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * .001,
                      ),
                      Text(
                        '17:36:12',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              subPages(),
            ],
          ),
        )
      ],
    );
  }

  Widget subPages() {
    SubSideBar subbar = SubSideBar();
    return Wrap(
      children: [
        BlocBuilder<BaseBloc, BaseState>(builder: (_, state) {
          if (state.indexPage == 0) {
            subbar.listSubPage = subbar.listHomePage;
          } else if (state.indexPage == 1) {
            subbar.listSubPage = subbar.listReprePage;
          } else if (state.indexPage == 2) {
            subbar.listSubPage = subbar.listContratosPage;
          } else if (state.indexPage == 3) {
            subbar.listSubPage = subbar.listExpansoesPage;
          } else if (state.indexPage == 4) {
            subbar.listSubPage = subbar.listDestaquesPage;
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: subbar.listSubPage.length,
              itemBuilder: (_, i) {
                Color letraColor =
                    (state.indexSubPage == i) ? Colors.white : Colors.white;
                Color fundoColor = (state.indexSubPage == i)
                    ? Color(0xff6C0087)
                    : Colors.purple;
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<BaseBloc>(context)
                        .add(UpdateSubPage(indexSubPage: i));
                  },
                  child: subPage(subbar.listSubPage[i], letraColor, fundoColor),
                );
              });
        }),
      ],
    );
  }

  Widget subPage(String subpage, Color letraColor, Color fundoColor) {
    return Container(
        color: fundoColor,
        height: 40,
        width: 50,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .004,
            left: MediaQuery.of(context).size.width * .002,
            right: MediaQuery.of(context).size.width * .005),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * .006,
          left: MediaQuery.of(context).size.width * .006,
        ),
        child: Text(subpage,
            textAlign: TextAlign.start,
            style: TextStyle(color: letraColor, fontSize: 16)));
  }

  Widget drawerClose() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = true;
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: double.infinity,
            width: 50,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      child: Image.asset('assets/sinaliza_notification.png')),
                ),
                Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height * .003,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .012,
                      bottom: MediaQuery.of(context).size.width * .012,
                      left: MediaQuery.of(context).size.width * .002,
                      right: MediaQuery.of(context).size.width * .002),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .004,
                      left: MediaQuery.of(context).size.width * .002,
                      right: MediaQuery.of(context).size.width * .002),
                ),
                Expanded(
                  flex: 90,
                  child: Align(alignment: Alignment.topCenter, child: pages()),
                ),
                Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height * .003,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .012,
                      bottom: MediaQuery.of(context).size.width * .012,
                      left: MediaQuery.of(context).size.width * .002,
                      right: MediaQuery.of(context).size.width * .002),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .004,
                      left: MediaQuery.of(context).size.width * .002,
                      right: MediaQuery.of(context).size.width * .002),
                ),
                Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .02),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 200,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .0),
            decoration: BoxDecoration(
              color: Color(0xff352238),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(6, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01,
                      left: MediaQuery.of(context).size.width * .005),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '15/02/2023',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * .001,
                        ),
                        Text(
                          '17:36:12',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(child: subPages()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buttomClose() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = false;
        });
      },
      child: Container(
        child: Icon(Icons.close, color: Colors.white, size: 26),
      ),
    );
  }
}
