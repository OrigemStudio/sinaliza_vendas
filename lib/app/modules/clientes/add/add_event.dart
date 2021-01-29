part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class AdicionarCliente extends AddEvent {
  final ClienteModel cliente;

  const AdicionarCliente({@required this.cliente}) : assert(cliente != null);

  @override
  List<Object> get props => [cliente];
}

class EditarCliente extends AddEvent {
  final ClienteModel cliente;

  const EditarCliente({@required this.cliente}) : assert(cliente != null);

  @override
  List<Object> get props => [cliente];
}

class GetEndereco extends AddEvent {
  final String cep;

  const GetEndereco({@required this.cep}) : assert(cep != null);

  @override
  List<Object> get props => [cep];
}
