part of 'clientes_bloc.dart';

abstract class ClientesState extends Equatable {
  const ClientesState();
  
  @override
  List<Object> get props => [];
}

class ClientesInitial extends ClientesState {}
