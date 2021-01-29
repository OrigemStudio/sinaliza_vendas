part of 'register_bloc.dart';

class RegisterState extends Equatable {
  String email;
  String senha;
  bool result;
  bool loading;

  RegisterState({this.email, this.senha, this.loading, this.result});

  RegisterState copyWith(
      {String email, String password, bool result, bool loading}) {
    return RegisterState(
        email: email ?? this.email,
        senha: senha ?? this.senha,
        result: result ?? this.result,
        loading: loading ?? this.loading);
  }

  @override
  List<Object> get props => [email, senha, result, loading];
}
