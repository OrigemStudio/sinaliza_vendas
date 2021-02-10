import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: height *.05,
                  left: width *.70,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: height *.45,
                        width: width *.60,
                        margin: EdgeInsets.only(
                          right: width *.030
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff352238),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(6, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height *.45,
                        width: width *.60,
                        decoration: BoxDecoration(
                          color: Color(0xff352238),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(6, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget card(String text, String value) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          Text(value, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
