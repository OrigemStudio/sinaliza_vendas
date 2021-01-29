import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/auth/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email;
  String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [form('email'), form('senha'), button()],
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
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (_, state) {
      return (state.loading)
          ? CircularProgressIndicator()
          : RaisedButton(
              onPressed: () async {
                BlocProvider.of<RegisterBloc>(context)
                    .add(RegisterEvent(email: email, senha: senha));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Registrar'),
              ),
            );
    });
  }
}
