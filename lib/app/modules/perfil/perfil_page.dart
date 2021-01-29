import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/auth/login/login_page.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Sair'),
            onPressed: () async {
              final _auth = FirebaseAuth.instance;
              await _auth.signOut();
              Get.off(LoginPage());
            }),
      ),
    );
  }
}
