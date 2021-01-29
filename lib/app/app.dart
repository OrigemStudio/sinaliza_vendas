import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/auth/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sinaliza Vendas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashPage(),
    );
  }
}
