part of 'login_bloc.dart';

class LoginState extends Equatable {
  String email;
  String senha;
  bool result;
  bool loading;

  LoginState({this.email, this.senha, this.loading, this.result});

  LoginState copyWith(
      {String email, String password, bool result, bool loading}) {
    return LoginState(
        email: email ?? this.email,
        senha: senha ?? this.senha,
        result: result ?? this.result,
        loading: loading ?? this.loading);
  }

  @override
  List<Object> get props => [email, senha, result, loading];
}
