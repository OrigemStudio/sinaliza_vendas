import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/auth/login/login_bloc.dart';
import 'package:sinaliza_vendas/app/auth/register/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String senha;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height *.35,
              width: width *.3,
              margin: EdgeInsets.only(
                top: height *.01,
                bottom: height *.01,
              ),
              child: Image.asset('assets/sinaliza_launch.png'),
            ),
            Container(
              height: height *.10,
              margin: EdgeInsets.only(
                bottom: height *.01,
              ),
              child: Text('Sinaliza Vendas',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                  fontSize: 45,
                ),
              ),
            ),
            Container(
                height: height *.06,
                width: width *.6,
                margin: EdgeInsets.only(
                  bottom: height *.01,
                  left: width *.03,
                  right: width *.03,
                ),
                child: form('email')),
            Container(
                height: height *.06,
                width: width *.6,
                margin: EdgeInsets.only(
                  bottom: height *.01,
                  left: width *.03,
                  right: width *.03,
                ),
                child: form('senha')),
            Container(
                width: width * .6,
                margin: EdgeInsets.only(
                  left: width *.03,
                  right: width *.03,
                ),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: buttonForgot())),
            Container(
                margin: EdgeInsets.only(
                  top: 50.h,
                  bottom: 50.h,
                ),
                child: button()),
            buttonRegister()
          ],
        ),
      ),
    );
  }

  Widget form(String field) {
    return Container(
      child: TextFormField(
        onChanged: (value) {
          (field == 'email') ? email = value : senha = value;
        },
        decoration: InputDecoration(
          labelText: field,
          focusedBorder: OutlineInputBorder(
            borderRadius:
            const BorderRadius.all(const Radius.circular(28.0)),
            borderSide: BorderSide(
              width: 3.0,
              color: Colors.purple,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            const BorderRadius.all(const Radius.circular(28.0)),
            borderSide: BorderSide(
              width: 1.8,
              color: Colors.purple[500],
            ),
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
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Logar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    });
  }

  Widget buttonRegister() {
    return TextButton(
      onPressed: () async {
        Get.to(RegisterPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Registrar',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget buttonForgot() {
    return TextButton(
      onPressed: () async {
        Get.to(RegisterPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Esqueceu a senha?',
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
