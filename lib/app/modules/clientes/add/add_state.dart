part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class InitialState extends AddState {}

class LoadingState extends AddState {}

class EditUser extends AddState {
  final ClienteModel cliente;

  const EditUser({@required this.cliente}) : assert(cliente != null);

  @override
  String toString() => 'EditUser { cliente: $cliente }';
}

class SetEndereco extends AddState {
  final EnderecoModel endereco;

  const SetEndereco({@required this.endereco}) : assert(endereco != null);

  @override
  String toString() => 'EditUser { endereco: $endereco }';
}
