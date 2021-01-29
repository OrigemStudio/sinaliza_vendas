import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/auth/login/login_bloc.dart';
import 'package:sinaliza_vendas/app/auth/register/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [form('email'), form('senha'), button(), buttonRegister()],
        ),
      ),
    );
  }

  Widget form(String field) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          onChanged: (value) {
            (field == 'email') ? email = value : senha = value;
          },
          decoration: InputDecoration(
            hintText: field,
            labelText: field,
          ),
        ),
      ),
    );
  }

  Widget button() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
      return (state.loading)
          ? CircularProgressIndicator()
          : RaisedButton(
              onPressed: () async {
                BlocProvider.of<LoginBloc>(context)
                    .add(LoginEvent(email: email, senha: senha));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Logar'),
              ),
            );
    });
  }

  Widget buttonRegister() {
    return RaisedButton(
      onPressed: () async {
        Get.to(RegisterPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Registrar'),
      ),
    );
  }
}
